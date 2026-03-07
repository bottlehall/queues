/// A specific queue that jobs are run on.
public struct QueueName: Sendable {
    /// The default queue that jobs are run on
    public static let `default` = Self(string: "default")

    /// The name of the queue
    public let string: String

    /// The maximum number of workers to run for this queue. If `nil`, uses ``QueuesConfiguration/workerCount``.
    public let workerCount: Int?

    /// Creates a new ``QueueName``
    ///
    /// - Parameter string: The name of the queue
    public init(string: String) {
        self.init(string: string, workerCount: nil)
    }

    /// - Parameters:
    ///   - string: The name of the queue
    ///   - workerCount: The maximum number of workers to run for this queue. If `nil`, defaults to ``QueuesConfiguration/workerCount``.
    ///      Set to `1` to run jobs sequentially.
    public init(string: String, workerCount: Int?) {
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
