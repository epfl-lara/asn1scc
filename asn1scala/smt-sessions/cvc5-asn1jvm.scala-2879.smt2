; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68912 () Bool)

(assert start!68912)

(declare-fun b!310849 () Bool)

(declare-fun res!254829 () Bool)

(declare-fun e!223349 () Bool)

(assert (=> b!310849 (=> (not res!254829) (not e!223349))))

(declare-datatypes ((array!18947 0))(
  ( (array!18948 (arr!9304 (Array (_ BitVec 32) (_ BitVec 8))) (size!8221 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13552 0))(
  ( (BitStream!13553 (buf!7837 array!18947) (currentByte!14425 (_ BitVec 32)) (currentBit!14420 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13552)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!310849 (= res!254829 (validate_offset_bits!1 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19)) nBits!480))))

(declare-fun res!254830 () Bool)

(assert (=> start!68912 (=> (not res!254830) (not e!223349))))

(assert (=> start!68912 (= res!254830 (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!68912 e!223349))

(assert (=> start!68912 true))

(declare-fun e!223347 () Bool)

(declare-fun inv!12 (BitStream!13552) Bool)

(assert (=> start!68912 (and (inv!12 bitStream!19) e!223347)))

(declare-fun thiss!1522 () BitStream!13552)

(declare-fun e!223348 () Bool)

(assert (=> start!68912 (and (inv!12 thiss!1522) e!223348)))

(declare-fun b!310850 () Bool)

(declare-fun e!223344 () Bool)

(assert (=> b!310850 (= e!223344 false)))

(declare-fun b!310851 () Bool)

(declare-fun array_inv!7776 (array!18947) Bool)

(assert (=> b!310851 (= e!223347 (array_inv!7776 (buf!7837 bitStream!19)))))

(declare-fun b!310852 () Bool)

(assert (=> b!310852 (= e!223348 (array_inv!7776 (buf!7837 thiss!1522)))))

(declare-fun b!310853 () Bool)

(assert (=> b!310853 (= e!223349 e!223344)))

(declare-fun c!15153 () Bool)

(assert (=> b!310853 (= c!15153 (= nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!23426 0))(
  ( (tuple2!23427 (_1!13306 Bool) (_2!13306 BitStream!13552)) )
))
(declare-fun lt!440691 () tuple2!23426)

(declare-fun b!310854 () Bool)

(declare-datatypes ((List!1002 0))(
  ( (Nil!999) (Cons!998 (h!1117 Bool) (t!1887 List!1002)) )
))
(declare-fun length!499 (List!1002) Int)

(declare-datatypes ((tuple2!23428 0))(
  ( (tuple2!23429 (_1!13307 List!1002) (_2!13307 BitStream!13552)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13552 BitStream!13552 (_ BitVec 64)) List!1002)

(assert (=> b!310854 (= e!223344 (<= (length!499 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))) 0))))

(declare-fun readBit!0 (BitStream!13552) tuple2!23426)

(assert (=> b!310854 (= lt!440691 (readBit!0 bitStream!19))))

(assert (= (and start!68912 res!254830) b!310849))

(assert (= (and b!310849 res!254829) b!310853))

(assert (= (and b!310853 c!15153) b!310850))

(assert (= (and b!310853 (not c!15153)) b!310854))

(assert (= start!68912 b!310851))

(assert (= start!68912 b!310852))

(declare-fun m!448615 () Bool)

(assert (=> b!310852 m!448615))

(declare-fun m!448617 () Bool)

(assert (=> b!310849 m!448617))

(declare-fun m!448619 () Bool)

(assert (=> b!310851 m!448619))

(declare-fun m!448621 () Bool)

(assert (=> start!68912 m!448621))

(declare-fun m!448623 () Bool)

(assert (=> start!68912 m!448623))

(declare-fun m!448625 () Bool)

(assert (=> b!310854 m!448625))

(declare-fun m!448627 () Bool)

(assert (=> b!310854 m!448627))

(declare-fun m!448629 () Bool)

(assert (=> b!310854 m!448629))

(push 1)

(assert (not b!310854))

(assert (not b!310852))

(assert (not b!310851))

(assert (not b!310849))

(assert (not start!68912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102914 () Bool)

(assert (=> d!102914 (= (array_inv!7776 (buf!7837 bitStream!19)) (bvsge (size!8221 (buf!7837 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310851 d!102914))

(declare-fun d!102916 () Bool)

(assert (=> d!102916 (= (array_inv!7776 (buf!7837 thiss!1522)) (bvsge (size!8221 (buf!7837 thiss!1522)) #b00000000000000000000000000000000))))

(assert (=> b!310852 d!102916))

(declare-fun d!102918 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!102918 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19)) nBits!480) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))) nBits!480))))

(declare-fun bs!26641 () Bool)

(assert (= bs!26641 d!102918))

(declare-fun m!448663 () Bool)

(assert (=> bs!26641 m!448663))

(assert (=> b!310849 d!102918))

(declare-fun d!102920 () Bool)

(declare-fun size!8224 (List!1002) Int)

(assert (=> d!102920 (= (length!499 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))) (size!8224 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))))))

(declare-fun bs!26642 () Bool)

(assert (= bs!26642 d!102920))

(declare-fun m!448665 () Bool)

(assert (=> bs!26642 m!448665))

(assert (=> b!310854 d!102920))

(declare-fun b!310904 () Bool)

(declare-fun e!223391 () Bool)

(declare-fun lt!440707 () List!1002)

(assert (=> b!310904 (= e!223391 (> (length!499 lt!440707) 0))))

(declare-fun lt!440708 () tuple2!23426)

(declare-fun e!223390 () tuple2!23428)

(declare-fun b!310902 () Bool)

(declare-fun lt!440706 () (_ BitVec 64))

(assert (=> b!310902 (= e!223390 (tuple2!23429 (Cons!998 (_1!13306 lt!440708) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440708) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706))) (_2!13306 lt!440708)))))

(assert (=> b!310902 (= lt!440708 (readBit!0 (_2!13306 lt!440691)))))

(assert (=> b!310902 (= lt!440706 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!102924 () Bool)

(assert (=> d!102924 e!223391))

(declare-fun c!15164 () Bool)

(assert (=> d!102924 (= c!15164 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102924 (= lt!440707 (_1!13307 e!223390))))

(declare-fun c!15165 () Bool)

(assert (=> d!102924 (= c!15165 (= (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102924 (bvsge (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102924 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!440707)))

(declare-fun b!310903 () Bool)

(declare-fun isEmpty!274 (List!1002) Bool)

(assert (=> b!310903 (= e!223391 (isEmpty!274 lt!440707))))

(declare-fun b!310901 () Bool)

(assert (=> b!310901 (= e!223390 (tuple2!23429 Nil!999 (_2!13306 lt!440691)))))

(assert (= (and d!102924 c!15165) b!310901))

(assert (= (and d!102924 (not c!15165)) b!310902))

(assert (= (and d!102924 c!15164) b!310903))

(assert (= (and d!102924 (not c!15164)) b!310904))

(declare-fun m!448673 () Bool)

(assert (=> b!310904 m!448673))

(declare-fun m!448675 () Bool)

(assert (=> b!310902 m!448675))

(declare-fun m!448677 () Bool)

(assert (=> b!310902 m!448677))

(declare-fun m!448679 () Bool)

(assert (=> b!310903 m!448679))

(assert (=> b!310854 d!102924))

(declare-fun d!102938 () Bool)

(declare-fun e!223419 () Bool)

(assert (=> d!102938 e!223419))

(declare-fun res!254847 () Bool)

(assert (=> d!102938 (=> (not res!254847) (not e!223419))))

(declare-datatypes ((Unit!21519 0))(
  ( (Unit!21520) )
))
(declare-datatypes ((tuple2!23438 0))(
  ( (tuple2!23439 (_1!13312 Unit!21519) (_2!13312 BitStream!13552)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13552) tuple2!23438)

(assert (=> d!102938 (= res!254847 (= (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19))) (buf!7837 bitStream!19)))))

(declare-fun lt!440756 () Bool)

(assert (=> d!102938 (= lt!440756 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440759 () tuple2!23426)

(assert (=> d!102938 (= lt!440759 (tuple2!23427 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 bitStream!19)))) #b00000000000000000000000000000000)) (_2!13312 (increaseBitIndex!0 bitStream!19))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!102938 (validate_offset_bit!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19)))))

(assert (=> d!102938 (= (readBit!0 bitStream!19) lt!440759)))

(declare-fun lt!440758 () (_ BitVec 64))

(declare-fun b!310931 () Bool)

(declare-fun lt!440753 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!310931 (= e!223419 (= (bitIndex!0 (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19)))) (currentByte!14425 (_2!13312 (increaseBitIndex!0 bitStream!19))) (currentBit!14420 (_2!13312 (increaseBitIndex!0 bitStream!19)))) (bvadd lt!440758 lt!440753)))))

(assert (=> b!310931 (or (not (= (bvand lt!440758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440753 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440758 lt!440753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310931 (= lt!440753 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310931 (= lt!440758 (bitIndex!0 (size!8221 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19) (currentBit!14420 bitStream!19)))))

(declare-fun lt!440754 () Bool)

(assert (=> b!310931 (= lt!440754 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440755 () Bool)

(assert (=> b!310931 (= lt!440755 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 bitStream!19)))) #b00000000000000000000000000000000)))))

(declare-fun lt!440757 () Bool)

(assert (=> b!310931 (= lt!440757 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 bitStream!19)))) #b00000000000000000000000000000000)))))

(assert (= (and d!102938 res!254847) b!310931))

(declare-fun m!448697 () Bool)

(assert (=> d!102938 m!448697))

(declare-fun m!448699 () Bool)

(assert (=> d!102938 m!448699))

(declare-fun m!448701 () Bool)

(assert (=> d!102938 m!448701))

(declare-fun m!448703 () Bool)

(assert (=> d!102938 m!448703))

(assert (=> b!310931 m!448699))

(assert (=> b!310931 m!448701))

(assert (=> b!310931 m!448697))

(declare-fun m!448705 () Bool)

(assert (=> b!310931 m!448705))

(declare-fun m!448707 () Bool)

(assert (=> b!310931 m!448707))

(assert (=> b!310854 d!102938))

(declare-fun d!102944 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102944 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14420 bitStream!19) (currentByte!14425 bitStream!19) (size!8221 (buf!7837 bitStream!19))))))

(declare-fun bs!26646 () Bool)

(assert (= bs!26646 d!102944))

(declare-fun m!448709 () Bool)

(assert (=> bs!26646 m!448709))

(assert (=> start!68912 d!102944))

(declare-fun d!102946 () Bool)

(assert (=> d!102946 (= (inv!12 thiss!1522) (invariant!0 (currentBit!14420 thiss!1522) (currentByte!14425 thiss!1522) (size!8221 (buf!7837 thiss!1522))))))

(declare-fun bs!26647 () Bool)

(assert (= bs!26647 d!102946))

(declare-fun m!448711 () Bool)

(assert (=> bs!26647 m!448711))

(assert (=> start!68912 d!102946))

(push 1)

(assert (not d!102918))

(assert (not b!310904))

(assert (not d!102944))

(assert (not d!102920))

(assert (not b!310902))

(assert (not d!102946))

(assert (not b!310931))

(assert (not d!102938))

(assert (not b!310903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102972 () Bool)

(assert (=> d!102972 (= (invariant!0 (currentBit!14420 thiss!1522) (currentByte!14425 thiss!1522) (size!8221 (buf!7837 thiss!1522))) (and (bvsge (currentBit!14420 thiss!1522) #b00000000000000000000000000000000) (bvslt (currentBit!14420 thiss!1522) #b00000000000000000000000000001000) (bvsge (currentByte!14425 thiss!1522) #b00000000000000000000000000000000) (or (bvslt (currentByte!14425 thiss!1522) (size!8221 (buf!7837 thiss!1522))) (and (= (currentBit!14420 thiss!1522) #b00000000000000000000000000000000) (= (currentByte!14425 thiss!1522) (size!8221 (buf!7837 thiss!1522)))))))))

(assert (=> d!102946 d!102972))

(declare-fun d!102974 () Bool)

(assert (=> d!102974 (= (isEmpty!274 lt!440707) (is-Nil!999 lt!440707))))

(assert (=> b!310903 d!102974))

(declare-fun d!102976 () Bool)

(assert (=> d!102976 (= (length!499 lt!440707) (size!8224 lt!440707))))

(declare-fun bs!26653 () Bool)

(assert (= bs!26653 d!102976))

(declare-fun m!448767 () Bool)

(assert (=> bs!26653 m!448767))

(assert (=> b!310904 d!102976))

(declare-fun d!102978 () Bool)

(declare-fun e!223433 () Bool)

(assert (=> d!102978 e!223433))

(declare-fun res!254864 () Bool)

(assert (=> d!102978 (=> (not res!254864) (not e!223433))))

(declare-fun lt!440830 () (_ BitVec 64))

(declare-fun lt!440828 () (_ BitVec 64))

(declare-fun lt!440827 () tuple2!23438)

(assert (=> d!102978 (= res!254864 (= (bvadd lt!440830 lt!440828) (bitIndex!0 (size!8221 (buf!7837 (_2!13312 lt!440827))) (currentByte!14425 (_2!13312 lt!440827)) (currentBit!14420 (_2!13312 lt!440827)))))))

(assert (=> d!102978 (or (not (= (bvand lt!440830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440828 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440830 lt!440828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102978 (= lt!440828 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!102978 (= lt!440830 (bitIndex!0 (size!8221 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19) (currentBit!14420 bitStream!19)))))

(declare-fun Unit!21525 () Unit!21519)

(declare-fun Unit!21526 () Unit!21519)

(assert (=> d!102978 (= lt!440827 (ite (bvslt (currentBit!14420 bitStream!19) #b00000000000000000000000000000111) (tuple2!23439 Unit!21525 (BitStream!13553 (buf!7837 bitStream!19) (currentByte!14425 bitStream!19) (bvadd (currentBit!14420 bitStream!19) #b00000000000000000000000000000001))) (tuple2!23439 Unit!21526 (BitStream!13553 (buf!7837 bitStream!19) (bvadd (currentByte!14425 bitStream!19) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!102978 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102978 (= (increaseBitIndex!0 bitStream!19) lt!440827)))

(declare-fun b!310951 () Bool)

(declare-fun res!254863 () Bool)

(assert (=> b!310951 (=> (not res!254863) (not e!223433))))

(declare-fun lt!440829 () (_ BitVec 64))

(declare-fun lt!440826 () (_ BitVec 64))

(assert (=> b!310951 (= res!254863 (= (bvsub lt!440829 lt!440826) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!310951 (or (= (bvand lt!440829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440829 lt!440826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310951 (= lt!440826 (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 (_2!13312 lt!440827)))) ((_ sign_extend 32) (currentByte!14425 (_2!13312 lt!440827))) ((_ sign_extend 32) (currentBit!14420 (_2!13312 lt!440827)))))))

(assert (=> b!310951 (= lt!440829 (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))))))

(declare-fun b!310952 () Bool)

(assert (=> b!310952 (= e!223433 (= (size!8221 (buf!7837 bitStream!19)) (size!8221 (buf!7837 (_2!13312 lt!440827)))))))

(assert (= (and d!102978 res!254864) b!310951))

(assert (= (and b!310951 res!254863) b!310952))

(declare-fun m!448773 () Bool)

(assert (=> d!102978 m!448773))

(assert (=> d!102978 m!448707))

(assert (=> d!102978 m!448663))

(declare-fun m!448775 () Bool)

(assert (=> b!310951 m!448775))

(assert (=> b!310951 m!448663))

(assert (=> d!102938 d!102978))

(declare-fun d!102986 () Bool)

(assert (=> d!102986 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!26654 () Bool)

(assert (= bs!26654 d!102986))

(assert (=> bs!26654 m!448663))

(assert (=> d!102938 d!102986))

(declare-fun d!102988 () Bool)

(assert (=> d!102988 (= (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))) (bvsub (bvmul ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14425 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14420 bitStream!19)))))))

(assert (=> d!102918 d!102988))

(declare-fun d!102990 () Bool)

(assert (=> d!102990 (= (invariant!0 (currentBit!14420 bitStream!19) (currentByte!14425 bitStream!19) (size!8221 (buf!7837 bitStream!19))) (and (bvsge (currentBit!14420 bitStream!19) #b00000000000000000000000000000000) (bvslt (currentBit!14420 bitStream!19) #b00000000000000000000000000001000) (bvsge (currentByte!14425 bitStream!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!14425 bitStream!19) (size!8221 (buf!7837 bitStream!19))) (and (= (currentBit!14420 bitStream!19) #b00000000000000000000000000000000) (= (currentByte!14425 bitStream!19) (size!8221 (buf!7837 bitStream!19)))))))))

(assert (=> d!102944 d!102990))

(declare-fun d!102992 () Bool)

(declare-fun e!223441 () Bool)

(assert (=> d!102992 e!223441))

(declare-fun res!254878 () Bool)

(assert (=> d!102992 (=> (not res!254878) (not e!223441))))

(declare-fun lt!440865 () (_ BitVec 64))

(declare-fun lt!440868 () (_ BitVec 64))

(declare-fun lt!440866 () (_ BitVec 64))

(assert (=> d!102992 (= res!254878 (= lt!440865 (bvsub lt!440866 lt!440868)))))

(assert (=> d!102992 (or (= (bvand lt!440866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440866 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440866 lt!440868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102992 (= lt!440868 (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19))))) ((_ sign_extend 32) (currentByte!14425 (_2!13312 (increaseBitIndex!0 bitStream!19)))) ((_ sign_extend 32) (currentBit!14420 (_2!13312 (increaseBitIndex!0 bitStream!19))))))))

(declare-fun lt!440870 () (_ BitVec 64))

(declare-fun lt!440869 () (_ BitVec 64))

(assert (=> d!102992 (= lt!440866 (bvmul lt!440870 lt!440869))))

(assert (=> d!102992 (or (= lt!440870 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440869 (bvsdiv (bvmul lt!440870 lt!440869) lt!440870)))))

(assert (=> d!102992 (= lt!440869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102992 (= lt!440870 ((_ sign_extend 32) (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102992 (= lt!440865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14425 (_2!13312 (increaseBitIndex!0 bitStream!19)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14420 (_2!13312 (increaseBitIndex!0 bitStream!19))))))))

(assert (=> d!102992 (invariant!0 (currentBit!14420 (_2!13312 (increaseBitIndex!0 bitStream!19))) (currentByte!14425 (_2!13312 (increaseBitIndex!0 bitStream!19))) (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19)))))))

(assert (=> d!102992 (= (bitIndex!0 (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19)))) (currentByte!14425 (_2!13312 (increaseBitIndex!0 bitStream!19))) (currentBit!14420 (_2!13312 (increaseBitIndex!0 bitStream!19)))) lt!440865)))

(declare-fun b!310963 () Bool)

(declare-fun res!254877 () Bool)

(assert (=> b!310963 (=> (not res!254877) (not e!223441))))

(assert (=> b!310963 (= res!254877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440865))))

(declare-fun b!310964 () Bool)

(declare-fun lt!440867 () (_ BitVec 64))

(assert (=> b!310964 (= e!223441 (bvsle lt!440865 (bvmul lt!440867 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310964 (or (= lt!440867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440867 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440867)))))

(assert (=> b!310964 (= lt!440867 ((_ sign_extend 32) (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 bitStream!19))))))))

(assert (= (and d!102992 res!254878) b!310963))

(assert (= (and b!310963 res!254877) b!310964))

(declare-fun m!448781 () Bool)

(assert (=> d!102992 m!448781))

(declare-fun m!448783 () Bool)

(assert (=> d!102992 m!448783))

(assert (=> b!310931 d!102992))

(assert (=> b!310931 d!102978))

(declare-fun d!102996 () Bool)

(declare-fun e!223442 () Bool)

(assert (=> d!102996 e!223442))

(declare-fun res!254882 () Bool)

(assert (=> d!102996 (=> (not res!254882) (not e!223442))))

(declare-fun lt!440878 () (_ BitVec 64))

(declare-fun lt!440877 () (_ BitVec 64))

(declare-fun lt!440880 () (_ BitVec 64))

(assert (=> d!102996 (= res!254882 (= lt!440877 (bvsub lt!440878 lt!440880)))))

(assert (=> d!102996 (or (= (bvand lt!440878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!440878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!440878 lt!440880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!102996 (= lt!440880 (remainingBits!0 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))) ((_ sign_extend 32) (currentByte!14425 bitStream!19)) ((_ sign_extend 32) (currentBit!14420 bitStream!19))))))

(declare-fun lt!440882 () (_ BitVec 64))

(declare-fun lt!440881 () (_ BitVec 64))

(assert (=> d!102996 (= lt!440878 (bvmul lt!440882 lt!440881))))

(assert (=> d!102996 (or (= lt!440882 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!440881 (bvsdiv (bvmul lt!440882 lt!440881) lt!440882)))))

(assert (=> d!102996 (= lt!440881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!102996 (= lt!440882 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))))))

(assert (=> d!102996 (= lt!440877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14425 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14420 bitStream!19))))))

(assert (=> d!102996 (invariant!0 (currentBit!14420 bitStream!19) (currentByte!14425 bitStream!19) (size!8221 (buf!7837 bitStream!19)))))

(assert (=> d!102996 (= (bitIndex!0 (size!8221 (buf!7837 bitStream!19)) (currentByte!14425 bitStream!19) (currentBit!14420 bitStream!19)) lt!440877)))

(declare-fun b!310967 () Bool)

(declare-fun res!254881 () Bool)

(assert (=> b!310967 (=> (not res!254881) (not e!223442))))

(assert (=> b!310967 (= res!254881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!440877))))

(declare-fun b!310968 () Bool)

(declare-fun lt!440879 () (_ BitVec 64))

(assert (=> b!310968 (= e!223442 (bvsle lt!440877 (bvmul lt!440879 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!310968 (or (= lt!440879 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!440879 #b0000000000000000000000000000000000000000000000000000000000001000) lt!440879)))))

(assert (=> b!310968 (= lt!440879 ((_ sign_extend 32) (size!8221 (buf!7837 bitStream!19))))))

(assert (= (and d!102996 res!254882) b!310967))

(assert (= (and b!310967 res!254881) b!310968))

(assert (=> d!102996 m!448663))

(assert (=> d!102996 m!448709))

(assert (=> b!310931 d!102996))

(declare-fun b!310974 () Bool)

(declare-fun e!223444 () Bool)

(declare-fun lt!440884 () List!1002)

(assert (=> b!310974 (= e!223444 (> (length!499 lt!440884) 0))))

(declare-fun b!310972 () Bool)

(declare-fun e!223443 () tuple2!23428)

(declare-fun lt!440885 () tuple2!23426)

(declare-fun lt!440883 () (_ BitVec 64))

(assert (=> b!310972 (= e!223443 (tuple2!23429 (Cons!998 (_1!13306 lt!440885) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440885) (bvsub (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706) lt!440883))) (_2!13306 lt!440885)))))

(assert (=> b!310972 (= lt!440885 (readBit!0 (_2!13306 lt!440708)))))

(assert (=> b!310972 (= lt!440883 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!102998 () Bool)

(assert (=> d!102998 e!223444))

(declare-fun c!15180 () Bool)

(assert (=> d!102998 (= c!15180 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102998 (= lt!440884 (_1!13307 e!223443))))

(declare-fun c!15181 () Bool)

(assert (=> d!102998 (= c!15181 (= (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!102998 (bvsge (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!102998 (= (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440708) (bvsub (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001) lt!440706)) lt!440884)))

(declare-fun b!310973 () Bool)

(assert (=> b!310973 (= e!223444 (isEmpty!274 lt!440884))))

(declare-fun b!310971 () Bool)

(assert (=> b!310971 (= e!223443 (tuple2!23429 Nil!999 (_2!13306 lt!440708)))))

(assert (= (and d!102998 c!15181) b!310971))

(assert (= (and d!102998 (not c!15181)) b!310972))

(assert (= (and d!102998 c!15180) b!310973))

(assert (= (and d!102998 (not c!15180)) b!310974))

(declare-fun m!448785 () Bool)

(assert (=> b!310974 m!448785))

(declare-fun m!448787 () Bool)

(assert (=> b!310972 m!448787))

(declare-fun m!448789 () Bool)

(assert (=> b!310972 m!448789))

(declare-fun m!448791 () Bool)

(assert (=> b!310973 m!448791))

(assert (=> b!310902 d!102998))

(declare-fun d!103000 () Bool)

(declare-fun e!223445 () Bool)

(assert (=> d!103000 e!223445))

(declare-fun res!254883 () Bool)

(assert (=> d!103000 (=> (not res!254883) (not e!223445))))

(assert (=> d!103000 (= res!254883 (= (buf!7837 (_2!13312 (increaseBitIndex!0 (_2!13306 lt!440691)))) (buf!7837 (_2!13306 lt!440691))))))

(declare-fun lt!440889 () Bool)

(assert (=> d!103000 (= lt!440889 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 (_2!13306 lt!440691))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440892 () tuple2!23426)

(assert (=> d!103000 (= lt!440892 (tuple2!23427 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 (_2!13306 lt!440691))))) #b00000000000000000000000000000000)) (_2!13312 (increaseBitIndex!0 (_2!13306 lt!440691)))))))

(assert (=> d!103000 (validate_offset_bit!0 ((_ sign_extend 32) (size!8221 (buf!7837 (_2!13306 lt!440691)))) ((_ sign_extend 32) (currentByte!14425 (_2!13306 lt!440691))) ((_ sign_extend 32) (currentBit!14420 (_2!13306 lt!440691))))))

(assert (=> d!103000 (= (readBit!0 (_2!13306 lt!440691)) lt!440892)))

(declare-fun lt!440886 () (_ BitVec 64))

(declare-fun lt!440891 () (_ BitVec 64))

(declare-fun b!310975 () Bool)

(assert (=> b!310975 (= e!223445 (= (bitIndex!0 (size!8221 (buf!7837 (_2!13312 (increaseBitIndex!0 (_2!13306 lt!440691))))) (currentByte!14425 (_2!13312 (increaseBitIndex!0 (_2!13306 lt!440691)))) (currentBit!14420 (_2!13312 (increaseBitIndex!0 (_2!13306 lt!440691))))) (bvadd lt!440891 lt!440886)))))

(assert (=> b!310975 (or (not (= (bvand lt!440891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!440886 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!440891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!440891 lt!440886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!310975 (= lt!440886 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!310975 (= lt!440891 (bitIndex!0 (size!8221 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)) (currentBit!14420 (_2!13306 lt!440691))))))

(declare-fun lt!440887 () Bool)

(assert (=> b!310975 (= lt!440887 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 (_2!13306 lt!440691))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440888 () Bool)

(assert (=> b!310975 (= lt!440888 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 (_2!13306 lt!440691))))) #b00000000000000000000000000000000)))))

(declare-fun lt!440890 () Bool)

(assert (=> b!310975 (= lt!440890 (not (= (bvand ((_ sign_extend 24) (select (arr!9304 (buf!7837 (_2!13306 lt!440691))) (currentByte!14425 (_2!13306 lt!440691)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14420 (_2!13306 lt!440691))))) #b00000000000000000000000000000000)))))

(assert (= (and d!103000 res!254883) b!310975))

(declare-fun m!448793 () Bool)

(assert (=> d!103000 m!448793))

(declare-fun m!448795 () Bool)

(assert (=> d!103000 m!448795))

(declare-fun m!448797 () Bool)

(assert (=> d!103000 m!448797))

(declare-fun m!448799 () Bool)

(assert (=> d!103000 m!448799))

(assert (=> b!310975 m!448795))

(assert (=> b!310975 m!448797))

(assert (=> b!310975 m!448793))

(declare-fun m!448801 () Bool)

(assert (=> b!310975 m!448801))

(declare-fun m!448803 () Bool)

(assert (=> b!310975 m!448803))

(assert (=> b!310902 d!103000))

(declare-fun d!103002 () Bool)

(declare-fun lt!440910 () Int)

(assert (=> d!103002 (>= lt!440910 0)))

(declare-fun e!223451 () Int)

(assert (=> d!103002 (= lt!440910 e!223451)))

(declare-fun c!15184 () Bool)

(assert (=> d!103002 (= c!15184 (is-Nil!999 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))))))

(assert (=> d!103002 (= (size!8224 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))) lt!440910)))

(declare-fun b!310984 () Bool)

(assert (=> b!310984 (= e!223451 0)))

(declare-fun b!310985 () Bool)

(assert (=> b!310985 (= e!223451 (+ 1 (size!8224 (t!1887 (_1!13307 (tuple2!23429 (Cons!998 (_1!13306 lt!440691) (bitStreamReadBitsIntoList!0 thiss!1522 (_2!13306 lt!440691) (bvsub nBits!480 #b0000000000000000000000000000000000000000000000000000000000000001))) (_2!13306 lt!440691)))))))))

(assert (= (and d!103002 c!15184) b!310984))

(assert (= (and d!103002 (not c!15184)) b!310985))

(declare-fun m!448809 () Bool)

(assert (=> b!310985 m!448809))

(assert (=> d!102920 d!103002))

(push 1)

(assert (not b!310973))

(assert (not d!103000))

(assert (not b!310975))

(assert (not d!102992))

(assert (not d!102986))

(assert (not b!310972))

(assert (not d!102978))

(assert (not b!310985))

(assert (not b!310974))

(assert (not b!310951))

(assert (not d!102976))

(assert (not d!102996))

(check-sat)

(pop 1)

(push 1)

(check-sat)

