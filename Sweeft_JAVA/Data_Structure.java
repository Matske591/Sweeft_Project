public class Data_Structure {
    Node head;
    Node last;
    Node prev;

    static class Node {
        int data;
        Node next;


        Node(int d) {
            data = d;
            next = null;

        }

        public boolean node_equal(Node other) {
            return other != null && data == other.data;
        }

        public int getData() {
            return data;
        }

        public void setData(int data) {
            this.data = data;
        }

        public Node getNext() {
            return next;
        }

        public void setNext(Node next) {
            this.next = next;
        }
        Node() {
        }
    }

    public void insert(int data) {
        Node new_node = new Node(data);
        new_node.next = null;

        if (head == null) {
            head = new_node;
        } else {
            prev = last;
            last = new_node;
        }

    }

    public void remove_last() {
        if (head.node_equal(head)) {
            head = null;
            last = null;
            prev = null;
        } else if (head.next == last) {
            head.next = null;
            last = head;
        } else {
            last = prev;
            last.next = null;
        }
    }
}