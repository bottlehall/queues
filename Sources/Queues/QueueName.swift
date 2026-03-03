/// A specific queue that jobs are run on.
public struct QueueName: Sendable {
    /// The default queue that jobs are run on
    public static let `default` = Self(string: "default")

    /// The name of the queue
    public let string: String

    /// The maximum number of workers to run for this queue, or `nil` to use the global ``QueuesConfiguration/workerCount``.
    ///
    /// Set this to `1` to ensure jobs on this queue execute one at a time.
    public let workerCount: Int?

    /// Creates a new ``QueueName``
    ///
    /// - Parameters:
    ///   - string: The name of the queue.
    ///   - workerCount: The maximum number of workers to run for this queue.
    ///     Defaults to `nil`, which defers to the global ``QueuesConfiguration/workerCount``.
    public init(string: String, workerCount: Int? = nil) {
        self.string = string
        self.workerCount = workerCount
    }

    /// Makes the name of the queue
    ///
    /// - Parameter persistenceKey: The base persistence key
    /// - Returns: A string of the queue's fully qualified name
    public func makeKey(with persistenceKey: String) -> String {
        "\(persistenceKey)[\(self.string)]"
    }
}
