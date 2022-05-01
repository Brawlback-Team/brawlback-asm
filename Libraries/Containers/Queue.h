#ifndef __DEQUEIMPL
#define __DEQUEIMPL

#include "stddef.h"
#include "stdtypes.h"

template<typename T>
class Queue
{
    public:

    struct ListNode
    {
        T data;
        ListNode *next_ptr;
    };

        Queue()
        {}
        ~Queue() 
        {
            ListNode* old;
            while(head != nullptr) {
                old = head;
                head = head->next_ptr;
                delete old;
            }
        }

        /*
        void push_front(T const& x) 
        {
            ListNode* newHead = new ListNode{x, head};
            head = newHead;
            if( tail == nullptr ) {
                tail = head;
            }
            ++qsize;
        }
        */
        void push_back(T const& x) 
        {
            ListNode* newNode = new ListNode{x, nullptr};
            if ( empty() ) {
                head = newNode;
            }
            else {
                ListNode* newTail = newNode;
                if (tail == nullptr) {
                    tail = newTail;
                }
                else {
                    tail->next_ptr = newTail;
                    tail = newTail;
                }
            }
            ++qsize;
        }

        void pop_front(bool isDataPointer = false)
        {
            ListNode* old = head;
            head = head->next_ptr;
            if (isDataPointer)
                delete old->data;
            delete old;
            --qsize;
        }

        void clear() {
            ListNode* old;
            while(head != nullptr) {
                old = head;
                head = head->next_ptr;
                delete old;
            }
            qsize = 0;
            tail = nullptr;
        }

        T const&    front() const {return head->data;}
        T const&    back()  const {return tail->data;}
        ListNode*    getNodeFront() const { return head; }
        ListNode*    getNodeBack() const { return tail; }
        bool        empty() const {return head == nullptr;}
        size_t size()  const {return qsize;}

    private:
        ListNode*   head = nullptr;
        ListNode*   tail = nullptr;
        size_t qsize = 0;

};




#endif
