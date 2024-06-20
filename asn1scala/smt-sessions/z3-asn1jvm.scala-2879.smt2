; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68914 () Bool)

(assert start!68914)

(declare-fun res!254836 () Bool)

(declare-fun e!223366 () Bool)

(assert (=> start!68914 (=> (not res!254836) (not e!223366))))

(declare-fun nBits!480 () (_ BitVec 64))

(assert (=> start!68914 (= res!254836 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68914 e!223366))

(assert (=> start!68914 true))

(declare-datatypes ((array!18949 0))(
  ( (array!18950 (arr!9305 (Array (_ BitVec 32) (_ BitVec 8))) (size!8222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13554 0))(
  ( (BitStream!13555 (buf!7838 array!18949) (currentByte!14426 (_ BitVec 32)) (currentBit!14421 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13554)

(declare-fun e!223365 () Bool)

(declare-fun inv!12 (BitStream!13554) Bool)

(assert (=> start!68914 (and (inv!12 bitStream!19) e!223365)))

(declare-fun thiss!1522 () BitStream!13554)

(declare-fun e!223362 () Bool)

(assert (=> start!68914 (and (inv!12 thiss!1522) e!223362)))

(declare-fun b!310867 () Bool)

(declare-fun e!223367 () Bool)

(assert (=> b!310867 (= e!223366 e!223367)))

(declare-fun c!15156 () Bool)

(assert (=> b!310867 (= c!15156 (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!310868 () Bool)

(declare-datatypes ((tuple2!23430 0))(
  ( (tuple2!23431 (_1!13308 Bool) (_2!13308 BitStream!13554)) )
))
(declare-fun lt!440694 () tuple2!23430)

(declare-datatypes ((List!1003 0))(
  ( (Nil!1000) (Cons!999 (h!1118 Bool) (t!1888 List!1003)) )
))
(declare-fun length!500 (List!1003) Int)

(declare-datatypes ((tuple2!23432 0))(
  ( (tuple2!23433 (_1!13309 List!1003) (_2!13309 BitStream!13554)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13554 BitStream!13554 (_ BitVec 64)) List!1003)

(assert (=> b!310868 (= e!223367 (<= (length!500 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))) 0))))

(declare-fun readBit!0 (BitStream!13554) tuple2!23430)

(assert (=> b!310868 (= lt!440694 (readBit!0 bitStream!19))))

(declare-fun b!310869 () Bool)

(assert (=> b!310869 (= e!223367 false)))

(declare-fun b!310870 () Bool)

(declare-fun array_inv!7777 (array!18949) Bool)

(assert (=> b!310870 (= e!223362 (array_inv!7777 (buf!7838 thiss!1522)))))

(declare-fun b!310871 () Bool)

(declare-fun res!254835 () Bool)

(assert (=> b!310871 (=> (not res!254835) (not e!223366))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310871 (= res!254835 (validate_offset_bits!1 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19)) nBits!480))))

(declare-fun b!310872 () Bool)

(assert (=> b!310872 (= e!223365 (array_inv!7777 (buf!7838 bitStream!19)))))

(assert (= (and start!68914 res!254836) b!310871))

(assert (= (and b!310871 res!254835) b!310867))

(assert (= (and b!310867 c!15156) b!310869))

(assert (= (and b!310867 (not c!15156)) b!310868))

(assert (= start!68914 b!310872))

(assert (= start!68914 b!310870))

(declare-fun m!448631 () Bool)

(assert (=> b!310870 m!448631))

(declare-fun m!448633 () Bool)

(assert (=> start!68914 m!448633))

(declare-fun m!448635 () Bool)

(assert (=> start!68914 m!448635))

(declare-fun m!448637 () Bool)

(assert (=> b!310872 m!448637))

(declare-fun m!448639 () Bool)

(assert (=> b!310868 m!448639))

(declare-fun m!448641 () Bool)

(assert (=> b!310868 m!448641))

(declare-fun m!448643 () Bool)

(assert (=> b!310868 m!448643))

(declare-fun m!448645 () Bool)

(assert (=> b!310871 m!448645))

(check-sat (not start!68914) (not b!310870) (not b!310872) (not b!310868) (not b!310871))
(check-sat)
(get-model)

(declare-fun d!102926 () Bool)

(declare-fun size!8226 (List!1003) Int)

(assert (=> d!102926 (= (length!500 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))) (size!8226 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))))))

(declare-fun bs!26645 () Bool)

(assert (= bs!26645 d!102926))

(declare-fun m!448671 () Bool)

(assert (=> bs!26645 m!448671))

(assert (=> b!310868 d!102926))

(declare-fun b!310926 () Bool)

(declare-fun e!223407 () Bool)

(declare-fun lt!440722 () List!1003)

(assert (=> b!310926 (= e!223407 (> (length!500 lt!440722) 0))))

(declare-fun b!310923 () Bool)

(declare-fun e!223408 () tuple2!23432)

(assert (=> b!310923 (= e!223408 (tuple2!23433 Nil!1000 (_2!13308 lt!440694)))))

(declare-fun b!310924 () Bool)

(declare-fun lt!440723 () (_ BitVec 64))

(declare-fun lt!440724 () tuple2!23430)

(assert (=> b!310924 (= e!223408 (tuple2!23433 (Cons!999 (_1!13308 lt!440724) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440724) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723))) (_2!13308 lt!440724)))))

(assert (=> b!310924 (= lt!440724 (readBit!0 (_2!13308 lt!440694)))))

(assert (=> b!310924 (= lt!440723 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!310925 () Bool)

(declare-fun isEmpty!276 (List!1003) Bool)

(assert (=> b!310925 (= e!223407 (isEmpty!276 lt!440722))))

(declare-fun d!102936 () Bool)

(assert (=> d!102936 e!223407))

(declare-fun c!15176 () Bool)

(assert (=> d!102936 (= c!15176 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102936 (= lt!440722 (_1!13309 e!223408))))

(declare-fun c!15177 () Bool)

(assert (=> d!102936 (= c!15177 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102936 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102936 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!440722)))

(assert (= (and d!102936 c!15177) b!310923))

(assert (= (and d!102936 (not c!15177)) b!310924))

(assert (= (and d!102936 c!15176) b!310925))

(assert (= (and d!102936 (not c!15176)) b!310926))

(declare-fun m!448689 () Bool)

(assert (=> b!310926 m!448689))

(declare-fun m!448691 () Bool)

(assert (=> b!310924 m!448691))

(declare-fun m!448693 () Bool)

(assert (=> b!310924 m!448693))

(declare-fun m!448695 () Bool)

(assert (=> b!310925 m!448695))

(assert (=> b!310868 d!102936))

(declare-fun d!102942 () Bool)

(declare-fun e!223424 () Bool)

(assert (=> d!102942 e!223424))

(declare-fun res!254851 () Bool)

(assert (=> d!102942 (=> (not res!254851) (not e!223424))))

(declare-datatypes ((Unit!21523 0))(
  ( (Unit!21524) )
))
(declare-datatypes ((tuple2!23442 0))(
  ( (tuple2!23443 (_1!13314 Unit!21523) (_2!13314 BitStream!13554)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13554) tuple2!23442)

(assert (=> d!102942 (= res!254851 (= (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))) (buf!7838 bitStream!19)))))

(declare-fun lt!440784 () Bool)

(assert (=> d!102942 (= lt!440784 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440783 () tuple2!23430)

(assert (=> d!102942 (= lt!440783 (tuple2!23431 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13314 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102942 (validate_offset_bit!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19)))))

(assert (=> d!102942 (= (readBit!0 bitStream!19) lt!440783)))

(declare-fun b!310935 () Bool)

(declare-fun lt!440785 () (_ BitVec 64))

(declare-fun lt!440781 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310935 (= e!223424 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19)))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440785 lt!440781)))))

(assert (=> b!310935 (or (not (= (bvand lt!440785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440781 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440785 lt!440781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310935 (= lt!440781 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310935 (= lt!440785 (bitIndex!0 (size!8222 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19) (currentBit!14421 bitStream!19)))))

(declare-fun lt!440786 () Bool)

(assert (=> b!310935 (= lt!440786 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440787 () Bool)

(assert (=> b!310935 (= lt!440787 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440782 () Bool)

(assert (=> b!310935 (= lt!440782 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102942 res!254851) b!310935))

(declare-fun m!448729 () Bool)

(assert (=> d!102942 m!448729))

(declare-fun m!448731 () Bool)

(assert (=> d!102942 m!448731))

(declare-fun m!448733 () Bool)

(assert (=> d!102942 m!448733))

(declare-fun m!448735 () Bool)

(assert (=> d!102942 m!448735))

(declare-fun m!448737 () Bool)

(assert (=> b!310935 m!448737))

(declare-fun m!448739 () Bool)

(assert (=> b!310935 m!448739))

(assert (=> b!310935 m!448729))

(assert (=> b!310935 m!448731))

(assert (=> b!310935 m!448733))

(assert (=> b!310868 d!102942))

(declare-fun d!102952 () Bool)

(assert (=> d!102952 (= (array_inv!7777 (buf!7838 thiss!1522)) (bvsge (size!8222 (buf!7838 thiss!1522)) #b00000000000000000000000000000000))))

(assert (=> b!310870 d!102952))

(declare-fun d!102954 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))) nBits!480))))

(declare-fun bs!26650 () Bool)

(assert (= bs!26650 d!102954))

(declare-fun m!448741 () Bool)

(assert (=> bs!26650 m!448741))

(assert (=> b!310871 d!102954))

(declare-fun d!102956 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102956 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14421 bitStream!19) (currentByte!14426 bitStream!19) (size!8222 (buf!7838 bitStream!19))))))

(declare-fun bs!26651 () Bool)

(assert (= bs!26651 d!102956))

(declare-fun m!448743 () Bool)

(assert (=> bs!26651 m!448743))

(assert (=> start!68914 d!102956))

(declare-fun d!102958 () Bool)

(assert (=> d!102958 (= (inv!12 thiss!1522) (invariant!0 (currentBit!14421 thiss!1522) (currentByte!14426 thiss!1522) (size!8222 (buf!7838 thiss!1522))))))

(declare-fun bs!26652 () Bool)

(assert (= bs!26652 d!102958))

(declare-fun m!448745 () Bool)

(assert (=> bs!26652 m!448745))

(assert (=> start!68914 d!102958))

(declare-fun d!102960 () Bool)

(assert (=> d!102960 (= (array_inv!7777 (buf!7838 bitStream!19)) (bvsge (size!8222 (buf!7838 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310872 d!102960))

(check-sat (not b!310926) (not b!310924) (not d!102958) (not d!102942) (not b!310935) (not d!102926) (not b!310925) (not d!102956) (not d!102954))
(check-sat)
(get-model)

(declare-fun d!102962 () Bool)

(assert (=> d!102962 (= (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 bitStream!19)))))))

(assert (=> d!102954 d!102962))

(declare-fun b!310939 () Bool)

(declare-fun e!223425 () Bool)

(declare-fun lt!440788 () List!1003)

(assert (=> b!310939 (= e!223425 (> (length!500 lt!440788) 0))))

(declare-fun b!310936 () Bool)

(declare-fun e!223426 () tuple2!23432)

(assert (=> b!310936 (= e!223426 (tuple2!23433 Nil!1000 (_2!13308 lt!440724)))))

(declare-fun lt!440790 () tuple2!23430)

(declare-fun b!310937 () Bool)

(declare-fun lt!440789 () (_ BitVec 64))

(assert (=> b!310937 (= e!223426 (tuple2!23433 (Cons!999 (_1!13308 lt!440790) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440790) (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789))) (_2!13308 lt!440790)))))

(assert (=> b!310937 (= lt!440790 (readBit!0 (_2!13308 lt!440724)))))

(assert (=> b!310937 (= lt!440789 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!310938 () Bool)

(assert (=> b!310938 (= e!223425 (isEmpty!276 lt!440788))))

(declare-fun d!102964 () Bool)

(assert (=> d!102964 e!223425))

(declare-fun c!15178 () Bool)

(assert (=> d!102964 (= c!15178 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102964 (= lt!440788 (_1!13309 e!223426))))

(declare-fun c!15179 () Bool)

(assert (=> d!102964 (= c!15179 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102964 (bvsge (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102964 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440724) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723)) lt!440788)))

(assert (= (and d!102964 c!15179) b!310936))

(assert (= (and d!102964 (not c!15179)) b!310937))

(assert (= (and d!102964 c!15178) b!310938))

(assert (= (and d!102964 (not c!15178)) b!310939))

(declare-fun m!448747 () Bool)

(assert (=> b!310939 m!448747))

(declare-fun m!448749 () Bool)

(assert (=> b!310937 m!448749))

(declare-fun m!448751 () Bool)

(assert (=> b!310937 m!448751))

(declare-fun m!448753 () Bool)

(assert (=> b!310938 m!448753))

(assert (=> b!310924 d!102964))

(declare-fun d!102966 () Bool)

(declare-fun e!223427 () Bool)

(assert (=> d!102966 e!223427))

(declare-fun res!254852 () Bool)

(assert (=> d!102966 (=> (not res!254852) (not e!223427))))

(assert (=> d!102966 (= res!254852 (= (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))) (buf!7838 (_2!13308 lt!440694))))))

(declare-fun lt!440794 () Bool)

(assert (=> d!102966 (= lt!440794 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440694))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440793 () tuple2!23430)

(assert (=> d!102966 (= lt!440793 (tuple2!23431 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440694))))) #b00000000000000000000000000000000)) (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))))

(assert (=> d!102966 (validate_offset_bit!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694))))))

(assert (=> d!102966 (= (readBit!0 (_2!13308 lt!440694)) lt!440793)))

(declare-fun lt!440791 () (_ BitVec 64))

(declare-fun lt!440795 () (_ BitVec 64))

(declare-fun b!310940 () Bool)

(assert (=> b!310940 (= e!223427 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))) (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) (bvadd lt!440795 lt!440791)))))

(assert (=> b!310940 (or (not (= (bvand lt!440795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440791 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440795 lt!440791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310940 (= lt!440791 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310940 (= lt!440795 (bitIndex!0 (size!8222 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)) (currentBit!14421 (_2!13308 lt!440694))))))

(declare-fun lt!440796 () Bool)

(assert (=> b!310940 (= lt!440796 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440694))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440797 () Bool)

(assert (=> b!310940 (= lt!440797 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440694))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440792 () Bool)

(assert (=> b!310940 (= lt!440792 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440694))))) #b00000000000000000000000000000000)))))

(assert (= (and d!102966 res!254852) b!310940))

(declare-fun m!448755 () Bool)

(assert (=> d!102966 m!448755))

(declare-fun m!448757 () Bool)

(assert (=> d!102966 m!448757))

(declare-fun m!448759 () Bool)

(assert (=> d!102966 m!448759))

(declare-fun m!448761 () Bool)

(assert (=> d!102966 m!448761))

(declare-fun m!448763 () Bool)

(assert (=> b!310940 m!448763))

(declare-fun m!448765 () Bool)

(assert (=> b!310940 m!448765))

(assert (=> b!310940 m!448755))

(assert (=> b!310940 m!448757))

(assert (=> b!310940 m!448759))

(assert (=> b!310924 d!102966))

(declare-fun d!102968 () Bool)

(assert (=> d!102968 (= (invariant!0 (currentBit!14421 bitStream!19) (currentByte!14426 bitStream!19) (size!8222 (buf!7838 bitStream!19))) (and (bvsge (currentBit!14421 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14421 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14426 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14426 bitStream!19) (size!8222 (buf!7838 bitStream!19))) (and (= (currentBit!14421 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14426 bitStream!19) (size!8222 (buf!7838 bitStream!19)))))))))

(assert (=> d!102956 d!102968))

(declare-fun d!102970 () Bool)

(declare-fun e!223430 () Bool)

(assert (=> d!102970 e!223430))

(declare-fun res!254857 () Bool)

(assert (=> d!102970 (=> (not res!254857) (not e!223430))))

(declare-fun lt!440813 () (_ BitVec 64))

(declare-fun lt!440812 () (_ BitVec 64))

(declare-fun lt!440811 () (_ BitVec 64))

(assert (=> d!102970 (= res!254857 (= lt!440812 (bvsub lt!440813 lt!440811)))))

(assert (=> d!102970 (or (= (bvand lt!440813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440813 lt!440811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102970 (= lt!440811 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440815 () (_ BitVec 64))

(declare-fun lt!440810 () (_ BitVec 64))

(assert (=> d!102970 (= lt!440813 (bvmul lt!440815 lt!440810))))

(assert (=> d!102970 (or (= lt!440815 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440810 (bvsdiv (bvmul lt!440815 lt!440810) lt!440815)))))

(assert (=> d!102970 (= lt!440810 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102970 (= lt!440815 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102970 (= lt!440812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102970 (invariant!0 (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102970 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19)))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19)))) lt!440812)))

(declare-fun b!310945 () Bool)

(declare-fun res!254858 () Bool)

(assert (=> b!310945 (=> (not res!254858) (not e!223430))))

(assert (=> b!310945 (= res!254858 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440812))))

(declare-fun b!310946 () Bool)

(declare-fun lt!440814 () (_ BitVec 64))

(assert (=> b!310946 (= e!223430 (bvsle lt!440812 (bvmul lt!440814 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310946 (or (= lt!440814 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440814 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440814)))))

(assert (=> b!310946 (= lt!440814 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102970 res!254857) b!310945))

(assert (= (and b!310945 res!254858) b!310946))

(declare-fun m!448769 () Bool)

(assert (=> d!102970 m!448769))

(declare-fun m!448771 () Bool)

(assert (=> d!102970 m!448771))

(assert (=> b!310935 d!102970))

(declare-fun d!102984 () Bool)

(declare-fun e!223446 () Bool)

(assert (=> d!102984 e!223446))

(declare-fun res!254885 () Bool)

(assert (=> d!102984 (=> (not res!254885) (not e!223446))))

(declare-fun lt!440896 () tuple2!23442)

(declare-fun lt!440893 () (_ BitVec 64))

(declare-fun lt!440897 () (_ BitVec 64))

(assert (=> d!102984 (= res!254885 (= (bvadd lt!440897 lt!440893) (bitIndex!0 (size!8222 (buf!7838 (_2!13314 lt!440896))) (currentByte!14426 (_2!13314 lt!440896)) (currentBit!14421 (_2!13314 lt!440896)))))))

(assert (=> d!102984 (or (not (= (bvand lt!440897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440893 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440897 lt!440893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102984 (= lt!440893 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102984 (= lt!440897 (bitIndex!0 (size!8222 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19) (currentBit!14421 bitStream!19)))))

(declare-fun Unit!21529 () Unit!21523)

(declare-fun Unit!21530 () Unit!21523)

(assert (=> d!102984 (= lt!440896 (ite (bvslt (currentBit!14421 bitStream!19) #b00000000000000000000000000000111) (tuple2!23443 Unit!21529 (BitStream!13555 (buf!7838 bitStream!19) (currentByte!14426 bitStream!19) (bvadd (currentBit!14421 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23443 Unit!21530 (BitStream!13555 (buf!7838 bitStream!19) (bvadd (currentByte!14426 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102984 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102984 (= (increaseBitIndex!0 bitStream!19) lt!440896)))

(declare-fun b!310976 () Bool)

(declare-fun res!254884 () Bool)

(assert (=> b!310976 (=> (not res!254884) (not e!223446))))

(declare-fun lt!440894 () (_ BitVec 64))

(declare-fun lt!440895 () (_ BitVec 64))

(assert (=> b!310976 (= res!254884 (= (bvsub lt!440894 lt!440895) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310976 (or (= (bvand lt!440894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440894 lt!440895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310976 (= lt!440895 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440896))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440896)))))))

(assert (=> b!310976 (= lt!440894 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))))))

(declare-fun b!310977 () Bool)

(assert (=> b!310977 (= e!223446 (= (size!8222 (buf!7838 bitStream!19)) (size!8222 (buf!7838 (_2!13314 lt!440896)))))))

(assert (= (and d!102984 res!254885) b!310976))

(assert (= (and b!310976 res!254884) b!310977))

(declare-fun m!448805 () Bool)

(assert (=> d!102984 m!448805))

(assert (=> d!102984 m!448739))

(assert (=> d!102984 m!448741))

(declare-fun m!448807 () Bool)

(assert (=> b!310976 m!448807))

(assert (=> b!310976 m!448741))

(assert (=> b!310935 d!102984))

(declare-fun d!103004 () Bool)

(declare-fun e!223452 () Bool)

(assert (=> d!103004 e!223452))

(declare-fun res!254890 () Bool)

(assert (=> d!103004 (=> (not res!254890) (not e!223452))))

(declare-fun lt!440912 () (_ BitVec 64))

(declare-fun lt!440914 () (_ BitVec 64))

(declare-fun lt!440913 () (_ BitVec 64))

(assert (=> d!103004 (= res!254890 (= lt!440913 (bvsub lt!440914 lt!440912)))))

(assert (=> d!103004 (or (= (bvand lt!440914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440912 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440914 lt!440912) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103004 (= lt!440912 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))))))

(declare-fun lt!440916 () (_ BitVec 64))

(declare-fun lt!440911 () (_ BitVec 64))

(assert (=> d!103004 (= lt!440914 (bvmul lt!440916 lt!440911))))

(assert (=> d!103004 (or (= lt!440916 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440911 (bvsdiv (bvmul lt!440916 lt!440911) lt!440916)))))

(assert (=> d!103004 (= lt!440911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103004 (= lt!440916 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))))))

(assert (=> d!103004 (= lt!440913 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 bitStream!19))))))

(assert (=> d!103004 (invariant!0 (currentBit!14421 bitStream!19) (currentByte!14426 bitStream!19) (size!8222 (buf!7838 bitStream!19)))))

(assert (=> d!103004 (= (bitIndex!0 (size!8222 (buf!7838 bitStream!19)) (currentByte!14426 bitStream!19) (currentBit!14421 bitStream!19)) lt!440913)))

(declare-fun b!310988 () Bool)

(declare-fun res!254891 () Bool)

(assert (=> b!310988 (=> (not res!254891) (not e!223452))))

(assert (=> b!310988 (= res!254891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440913))))

(declare-fun b!310989 () Bool)

(declare-fun lt!440915 () (_ BitVec 64))

(assert (=> b!310989 (= e!223452 (bvsle lt!440913 (bvmul lt!440915 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310989 (or (= lt!440915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440915)))))

(assert (=> b!310989 (= lt!440915 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))))))

(assert (= (and d!103004 res!254890) b!310988))

(assert (= (and b!310988 res!254891) b!310989))

(assert (=> d!103004 m!448741))

(assert (=> d!103004 m!448743))

(assert (=> b!310935 d!103004))

(declare-fun d!103006 () Bool)

(get-info :version)

(assert (=> d!103006 (= (isEmpty!276 lt!440722) ((_ is Nil!1000) lt!440722))))

(assert (=> b!310925 d!103006))

(declare-fun d!103008 () Bool)

(assert (=> d!103008 (= (length!500 lt!440722) (size!8226 lt!440722))))

(declare-fun bs!26655 () Bool)

(assert (= bs!26655 d!103008))

(declare-fun m!448811 () Bool)

(assert (=> bs!26655 m!448811))

(assert (=> b!310926 d!103008))

(declare-fun d!103010 () Bool)

(declare-fun lt!440930 () Int)

(assert (=> d!103010 (>= lt!440930 0)))

(declare-fun e!223457 () Int)

(assert (=> d!103010 (= lt!440930 e!223457)))

(declare-fun c!15187 () Bool)

(assert (=> d!103010 (= c!15187 ((_ is Nil!1000) (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))))))

(assert (=> d!103010 (= (size!8226 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))) lt!440930)))

(declare-fun b!310998 () Bool)

(assert (=> b!310998 (= e!223457 0)))

(declare-fun b!310999 () Bool)

(assert (=> b!310999 (= e!223457 (+ 1 (size!8226 (t!1888 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694)))))))))

(assert (= (and d!103010 c!15187) b!310998))

(assert (= (and d!103010 (not c!15187)) b!310999))

(declare-fun m!448817 () Bool)

(assert (=> b!310999 m!448817))

(assert (=> d!102926 d!103010))

(declare-fun d!103016 () Bool)

(assert (=> d!103016 (= (invariant!0 (currentBit!14421 thiss!1522) (currentByte!14426 thiss!1522) (size!8222 (buf!7838 thiss!1522))) (and (bvsge (currentBit!14421 thiss!1522) #b00000000000000000000000000000000) (bvslt (currentBit!14421 thiss!1522) #b00000000000000000000000000001000) (bvsge (currentByte!14426 thiss!1522) #b00000000000000000000000000000000) (or (bvslt (currentByte!14426 thiss!1522) (size!8222 (buf!7838 thiss!1522))) (and (= (currentBit!14421 thiss!1522) #b00000000000000000000000000000000) (= (currentByte!14426 thiss!1522) (size!8222 (buf!7838 thiss!1522)))))))))

(assert (=> d!102958 d!103016))

(assert (=> d!102942 d!102984))

(declare-fun d!103018 () Bool)

(assert (=> d!103018 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 bitStream!19))) ((_ sign_extend 32) (currentByte!14426 bitStream!19)) ((_ sign_extend 32) (currentBit!14421 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26656 () Bool)

(assert (= bs!26656 d!103018))

(assert (=> bs!26656 m!448741))

(assert (=> d!102942 d!103018))

(check-sat (not b!310937) (not b!310999) (not b!310940) (not b!310939) (not d!102966) (not d!103004) (not d!102970) (not d!103008) (not d!102984) (not d!103018) (not b!310938) (not b!310976))
(check-sat)
(get-model)

(declare-fun d!103034 () Bool)

(declare-fun lt!440944 () Int)

(assert (=> d!103034 (>= lt!440944 0)))

(declare-fun e!223464 () Int)

(assert (=> d!103034 (= lt!440944 e!223464)))

(declare-fun c!15193 () Bool)

(assert (=> d!103034 (= c!15193 ((_ is Nil!1000) (t!1888 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694))))))))

(assert (=> d!103034 (= (size!8226 (t!1888 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694))))) lt!440944)))

(declare-fun b!311011 () Bool)

(assert (=> b!311011 (= e!223464 0)))

(declare-fun b!311012 () Bool)

(assert (=> b!311012 (= e!223464 (+ 1 (size!8226 (t!1888 (t!1888 (_1!13309 (tuple2!23433 (Cons!999 (_1!13308 lt!440694) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440694) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13308 lt!440694))))))))))

(assert (= (and d!103034 c!15193) b!311011))

(assert (= (and d!103034 (not c!15193)) b!311012))

(declare-fun m!448843 () Bool)

(assert (=> b!311012 m!448843))

(assert (=> b!310999 d!103034))

(declare-fun d!103036 () Bool)

(declare-fun e!223465 () Bool)

(assert (=> d!103036 e!223465))

(declare-fun res!254897 () Bool)

(assert (=> d!103036 (=> (not res!254897) (not e!223465))))

(declare-fun lt!440946 () (_ BitVec 64))

(declare-fun lt!440948 () (_ BitVec 64))

(declare-fun lt!440947 () (_ BitVec 64))

(assert (=> d!103036 (= res!254897 (= lt!440947 (bvsub lt!440948 lt!440946)))))

(assert (=> d!103036 (or (= (bvand lt!440948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440946 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440948 lt!440946) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103036 (= lt!440946 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440896))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440896)))))))

(declare-fun lt!440950 () (_ BitVec 64))

(declare-fun lt!440945 () (_ BitVec 64))

(assert (=> d!103036 (= lt!440948 (bvmul lt!440950 lt!440945))))

(assert (=> d!103036 (or (= lt!440950 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440945 (bvsdiv (bvmul lt!440950 lt!440945) lt!440950)))))

(assert (=> d!103036 (= lt!440945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103036 (= lt!440950 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))))))

(assert (=> d!103036 (= lt!440947 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440896))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440896)))))))

(assert (=> d!103036 (invariant!0 (currentBit!14421 (_2!13314 lt!440896)) (currentByte!14426 (_2!13314 lt!440896)) (size!8222 (buf!7838 (_2!13314 lt!440896))))))

(assert (=> d!103036 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 lt!440896))) (currentByte!14426 (_2!13314 lt!440896)) (currentBit!14421 (_2!13314 lt!440896))) lt!440947)))

(declare-fun b!311013 () Bool)

(declare-fun res!254898 () Bool)

(assert (=> b!311013 (=> (not res!254898) (not e!223465))))

(assert (=> b!311013 (= res!254898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440947))))

(declare-fun b!311014 () Bool)

(declare-fun lt!440949 () (_ BitVec 64))

(assert (=> b!311014 (= e!223465 (bvsle lt!440947 (bvmul lt!440949 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311014 (or (= lt!440949 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440949 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440949)))))

(assert (=> b!311014 (= lt!440949 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))))))

(assert (= (and d!103036 res!254897) b!311013))

(assert (= (and b!311013 res!254898) b!311014))

(assert (=> d!103036 m!448807))

(declare-fun m!448845 () Bool)

(assert (=> d!103036 m!448845))

(assert (=> d!102984 d!103036))

(assert (=> d!102984 d!103004))

(assert (=> d!102984 d!102962))

(declare-fun b!311018 () Bool)

(declare-fun e!223466 () Bool)

(declare-fun lt!440951 () List!1003)

(assert (=> b!311018 (= e!223466 (> (length!500 lt!440951) 0))))

(declare-fun b!311015 () Bool)

(declare-fun e!223467 () tuple2!23432)

(assert (=> b!311015 (= e!223467 (tuple2!23433 Nil!1000 (_2!13308 lt!440790)))))

(declare-fun b!311016 () Bool)

(declare-fun lt!440952 () (_ BitVec 64))

(declare-fun lt!440953 () tuple2!23430)

(assert (=> b!311016 (= e!223467 (tuple2!23433 (Cons!999 (_1!13308 lt!440953) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440953) (bvsub (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789) lt!440952))) (_2!13308 lt!440953)))))

(assert (=> b!311016 (= lt!440953 (readBit!0 (_2!13308 lt!440790)))))

(assert (=> b!311016 (= lt!440952 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!311017 () Bool)

(assert (=> b!311017 (= e!223466 (isEmpty!276 lt!440951))))

(declare-fun d!103038 () Bool)

(assert (=> d!103038 e!223466))

(declare-fun c!15194 () Bool)

(assert (=> d!103038 (= c!15194 (= (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!103038 (= lt!440951 (_1!13309 e!223467))))

(declare-fun c!15195 () Bool)

(assert (=> d!103038 (= c!15195 (= (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!103038 (bvsge (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!103038 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13308 lt!440790) (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440723) lt!440789)) lt!440951)))

(assert (= (and d!103038 c!15195) b!311015))

(assert (= (and d!103038 (not c!15195)) b!311016))

(assert (= (and d!103038 c!15194) b!311017))

(assert (= (and d!103038 (not c!15194)) b!311018))

(declare-fun m!448847 () Bool)

(assert (=> b!311018 m!448847))

(declare-fun m!448849 () Bool)

(assert (=> b!311016 m!448849))

(declare-fun m!448851 () Bool)

(assert (=> b!311016 m!448851))

(declare-fun m!448853 () Bool)

(assert (=> b!311017 m!448853))

(assert (=> b!310937 d!103038))

(declare-fun d!103040 () Bool)

(declare-fun e!223468 () Bool)

(assert (=> d!103040 e!223468))

(declare-fun res!254899 () Bool)

(assert (=> d!103040 (=> (not res!254899) (not e!223468))))

(assert (=> d!103040 (= res!254899 (= (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440724)))) (buf!7838 (_2!13308 lt!440724))))))

(declare-fun lt!440957 () Bool)

(assert (=> d!103040 (= lt!440957 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440724))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440956 () tuple2!23430)

(assert (=> d!103040 (= lt!440956 (tuple2!23431 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440724))))) #b00000000000000000000000000000000)) (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440724)))))))

(assert (=> d!103040 (validate_offset_bit!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440724)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440724))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440724))))))

(assert (=> d!103040 (= (readBit!0 (_2!13308 lt!440724)) lt!440956)))

(declare-fun b!311019 () Bool)

(declare-fun lt!440954 () (_ BitVec 64))

(declare-fun lt!440958 () (_ BitVec 64))

(assert (=> b!311019 (= e!223468 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440724))))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440724)))) (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440724))))) (bvadd lt!440958 lt!440954)))))

(assert (=> b!311019 (or (not (= (bvand lt!440958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440954 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440958 lt!440954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311019 (= lt!440954 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!311019 (= lt!440958 (bitIndex!0 (size!8222 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)) (currentBit!14421 (_2!13308 lt!440724))))))

(declare-fun lt!440959 () Bool)

(assert (=> b!311019 (= lt!440959 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440724))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440960 () Bool)

(assert (=> b!311019 (= lt!440960 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440724))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440955 () Bool)

(assert (=> b!311019 (= lt!440955 (not (= (bvand ((_ sign_extend 24) (select (arr!9305 (buf!7838 (_2!13308 lt!440724))) (currentByte!14426 (_2!13308 lt!440724)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14421 (_2!13308 lt!440724))))) #b00000000000000000000000000000000)))))

(assert (= (and d!103040 res!254899) b!311019))

(declare-fun m!448855 () Bool)

(assert (=> d!103040 m!448855))

(declare-fun m!448857 () Bool)

(assert (=> d!103040 m!448857))

(declare-fun m!448859 () Bool)

(assert (=> d!103040 m!448859))

(declare-fun m!448861 () Bool)

(assert (=> d!103040 m!448861))

(declare-fun m!448863 () Bool)

(assert (=> b!311019 m!448863))

(declare-fun m!448865 () Bool)

(assert (=> b!311019 m!448865))

(assert (=> b!311019 m!448855))

(assert (=> b!311019 m!448857))

(assert (=> b!311019 m!448859))

(assert (=> b!310937 d!103040))

(declare-fun d!103042 () Bool)

(declare-fun e!223469 () Bool)

(assert (=> d!103042 e!223469))

(declare-fun res!254900 () Bool)

(assert (=> d!103042 (=> (not res!254900) (not e!223469))))

(declare-fun lt!440964 () (_ BitVec 64))

(declare-fun lt!440963 () (_ BitVec 64))

(declare-fun lt!440962 () (_ BitVec 64))

(assert (=> d!103042 (= res!254900 (= lt!440963 (bvsub lt!440964 lt!440962)))))

(assert (=> d!103042 (or (= (bvand lt!440964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440964 lt!440962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103042 (= lt!440962 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))))))

(declare-fun lt!440966 () (_ BitVec 64))

(declare-fun lt!440961 () (_ BitVec 64))

(assert (=> d!103042 (= lt!440964 (bvmul lt!440966 lt!440961))))

(assert (=> d!103042 (or (= lt!440966 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440961 (bvsdiv (bvmul lt!440966 lt!440961) lt!440966)))))

(assert (=> d!103042 (= lt!440961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103042 (= lt!440966 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))))))

(assert (=> d!103042 (= lt!440963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))))))

(assert (=> d!103042 (invariant!0 (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))))))

(assert (=> d!103042 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))) (currentBit!14421 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694))))) lt!440963)))

(declare-fun b!311020 () Bool)

(declare-fun res!254901 () Bool)

(assert (=> b!311020 (=> (not res!254901) (not e!223469))))

(assert (=> b!311020 (= res!254901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440963))))

(declare-fun b!311021 () Bool)

(declare-fun lt!440965 () (_ BitVec 64))

(assert (=> b!311021 (= e!223469 (bvsle lt!440963 (bvmul lt!440965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311021 (or (= lt!440965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440965)))))

(assert (=> b!311021 (= lt!440965 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 (_2!13308 lt!440694)))))))))

(assert (= (and d!103042 res!254900) b!311020))

(assert (= (and b!311020 res!254901) b!311021))

(declare-fun m!448867 () Bool)

(assert (=> d!103042 m!448867))

(declare-fun m!448869 () Bool)

(assert (=> d!103042 m!448869))

(assert (=> b!310940 d!103042))

(declare-fun d!103044 () Bool)

(declare-fun e!223470 () Bool)

(assert (=> d!103044 e!223470))

(declare-fun res!254903 () Bool)

(assert (=> d!103044 (=> (not res!254903) (not e!223470))))

(declare-fun lt!440970 () tuple2!23442)

(declare-fun lt!440971 () (_ BitVec 64))

(declare-fun lt!440967 () (_ BitVec 64))

(assert (=> d!103044 (= res!254903 (= (bvadd lt!440971 lt!440967) (bitIndex!0 (size!8222 (buf!7838 (_2!13314 lt!440970))) (currentByte!14426 (_2!13314 lt!440970)) (currentBit!14421 (_2!13314 lt!440970)))))))

(assert (=> d!103044 (or (not (= (bvand lt!440971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440967 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440971 lt!440967) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103044 (= lt!440967 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!103044 (= lt!440971 (bitIndex!0 (size!8222 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)) (currentBit!14421 (_2!13308 lt!440694))))))

(declare-fun Unit!21531 () Unit!21523)

(declare-fun Unit!21532 () Unit!21523)

(assert (=> d!103044 (= lt!440970 (ite (bvslt (currentBit!14421 (_2!13308 lt!440694)) #b00000000000000000000000000000111) (tuple2!23443 Unit!21531 (BitStream!13555 (buf!7838 (_2!13308 lt!440694)) (currentByte!14426 (_2!13308 lt!440694)) (bvadd (currentBit!14421 (_2!13308 lt!440694)) #b00000000000000000000000000000001))) (tuple2!23443 Unit!21532 (BitStream!13555 (buf!7838 (_2!13308 lt!440694)) (bvadd (currentByte!14426 (_2!13308 lt!440694)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!103044 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!103044 (= (increaseBitIndex!0 (_2!13308 lt!440694)) lt!440970)))

(declare-fun b!311022 () Bool)

(declare-fun res!254902 () Bool)

(assert (=> b!311022 (=> (not res!254902) (not e!223470))))

(declare-fun lt!440968 () (_ BitVec 64))

(declare-fun lt!440969 () (_ BitVec 64))

(assert (=> b!311022 (= res!254902 (= (bvsub lt!440968 lt!440969) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!311022 (or (= (bvand lt!440968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440968 lt!440969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311022 (= lt!440969 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440970)))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440970))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440970)))))))

(assert (=> b!311022 (= lt!440968 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))))))

(declare-fun b!311023 () Bool)

(assert (=> b!311023 (= e!223470 (= (size!8222 (buf!7838 (_2!13308 lt!440694))) (size!8222 (buf!7838 (_2!13314 lt!440970)))))))

(assert (= (and d!103044 res!254903) b!311022))

(assert (= (and b!311022 res!254902) b!311023))

(declare-fun m!448871 () Bool)

(assert (=> d!103044 m!448871))

(assert (=> d!103044 m!448765))

(declare-fun m!448873 () Bool)

(assert (=> d!103044 m!448873))

(declare-fun m!448875 () Bool)

(assert (=> b!311022 m!448875))

(assert (=> b!311022 m!448873))

(assert (=> b!310940 d!103044))

(declare-fun d!103046 () Bool)

(declare-fun e!223471 () Bool)

(assert (=> d!103046 e!223471))

(declare-fun res!254904 () Bool)

(assert (=> d!103046 (=> (not res!254904) (not e!223471))))

(declare-fun lt!440973 () (_ BitVec 64))

(declare-fun lt!440974 () (_ BitVec 64))

(declare-fun lt!440975 () (_ BitVec 64))

(assert (=> d!103046 (= res!254904 (= lt!440974 (bvsub lt!440975 lt!440973)))))

(assert (=> d!103046 (or (= (bvand lt!440975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440975 lt!440973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103046 (= lt!440973 (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))))))

(declare-fun lt!440977 () (_ BitVec 64))

(declare-fun lt!440972 () (_ BitVec 64))

(assert (=> d!103046 (= lt!440975 (bvmul lt!440977 lt!440972))))

(assert (=> d!103046 (or (= lt!440977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440972 (bvsdiv (bvmul lt!440977 lt!440972) lt!440977)))))

(assert (=> d!103046 (= lt!440972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103046 (= lt!440977 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))))))

(assert (=> d!103046 (= lt!440974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))))))

(assert (=> d!103046 (invariant!0 (currentBit!14421 (_2!13308 lt!440694)) (currentByte!14426 (_2!13308 lt!440694)) (size!8222 (buf!7838 (_2!13308 lt!440694))))))

(assert (=> d!103046 (= (bitIndex!0 (size!8222 (buf!7838 (_2!13308 lt!440694))) (currentByte!14426 (_2!13308 lt!440694)) (currentBit!14421 (_2!13308 lt!440694))) lt!440974)))

(declare-fun b!311024 () Bool)

(declare-fun res!254905 () Bool)

(assert (=> b!311024 (=> (not res!254905) (not e!223471))))

(assert (=> b!311024 (= res!254905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440974))))

(declare-fun b!311025 () Bool)

(declare-fun lt!440976 () (_ BitVec 64))

(assert (=> b!311025 (= e!223471 (bvsle lt!440974 (bvmul lt!440976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311025 (or (= lt!440976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440976)))))

(assert (=> b!311025 (= lt!440976 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))))))

(assert (= (and d!103046 res!254904) b!311024))

(assert (= (and b!311024 res!254905) b!311025))

(assert (=> d!103046 m!448873))

(declare-fun m!448877 () Bool)

(assert (=> d!103046 m!448877))

(assert (=> b!310940 d!103046))

(assert (=> d!103004 d!102962))

(assert (=> d!103004 d!102968))

(declare-fun d!103048 () Bool)

(assert (=> d!103048 (= (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))))) (bvsub (bvmul ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19)))))))))

(assert (=> d!102970 d!103048))

(declare-fun d!103050 () Bool)

(assert (=> d!103050 (= (invariant!0 (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))) (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))) (and (bvsge (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))) #b00000000000000000000000000000000) (bvslt (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))) #b00000000000000000000000000001000) (bvsge (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) #b00000000000000000000000000000000) (or (bvslt (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19))))) (and (= (currentBit!14421 (_2!13314 (increaseBitIndex!0 bitStream!19))) #b00000000000000000000000000000000) (= (currentByte!14426 (_2!13314 (increaseBitIndex!0 bitStream!19))) (size!8222 (buf!7838 (_2!13314 (increaseBitIndex!0 bitStream!19)))))))))))

(assert (=> d!102970 d!103050))

(assert (=> d!102966 d!103044))

(declare-fun d!103052 () Bool)

(assert (=> d!103052 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13308 lt!440694)))) ((_ sign_extend 32) (currentByte!14426 (_2!13308 lt!440694))) ((_ sign_extend 32) (currentBit!14421 (_2!13308 lt!440694)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26659 () Bool)

(assert (= bs!26659 d!103052))

(assert (=> bs!26659 m!448873))

(assert (=> d!102966 d!103052))

(declare-fun d!103054 () Bool)

(declare-fun lt!440978 () Int)

(assert (=> d!103054 (>= lt!440978 0)))

(declare-fun e!223472 () Int)

(assert (=> d!103054 (= lt!440978 e!223472)))

(declare-fun c!15196 () Bool)

(assert (=> d!103054 (= c!15196 ((_ is Nil!1000) lt!440722))))

(assert (=> d!103054 (= (size!8226 lt!440722) lt!440978)))

(declare-fun b!311026 () Bool)

(assert (=> b!311026 (= e!223472 0)))

(declare-fun b!311027 () Bool)

(assert (=> b!311027 (= e!223472 (+ 1 (size!8226 (t!1888 lt!440722))))))

(assert (= (and d!103054 c!15196) b!311026))

(assert (= (and d!103054 (not c!15196)) b!311027))

(declare-fun m!448879 () Bool)

(assert (=> b!311027 m!448879))

(assert (=> d!103008 d!103054))

(declare-fun d!103056 () Bool)

(assert (=> d!103056 (= (isEmpty!276 lt!440788) ((_ is Nil!1000) lt!440788))))

(assert (=> b!310938 d!103056))

(declare-fun d!103058 () Bool)

(assert (=> d!103058 (= (length!500 lt!440788) (size!8226 lt!440788))))

(declare-fun bs!26660 () Bool)

(assert (= bs!26660 d!103058))

(declare-fun m!448881 () Bool)

(assert (=> bs!26660 m!448881))

(assert (=> b!310939 d!103058))

(assert (=> d!103018 d!102962))

(declare-fun d!103060 () Bool)

(assert (=> d!103060 (= (remainingBits!0 ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))) ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440896))) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440896)))) (bvsub (bvmul ((_ sign_extend 32) (size!8222 (buf!7838 (_2!13314 lt!440896)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14426 (_2!13314 lt!440896))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14421 (_2!13314 lt!440896))))))))

(assert (=> b!310976 d!103060))

(assert (=> b!310976 d!102962))

(check-sat (not b!311019) (not b!311018) (not d!103040) (not d!103042) (not d!103036) (not d!103044) (not b!311017) (not b!311027) (not d!103046) (not b!311016) (not b!311012) (not b!311022) (not d!103058) (not d!103052))
(check-sat)
