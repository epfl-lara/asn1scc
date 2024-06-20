; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18804 () Bool)

(assert start!18804)

(declare-fun b!93834 () Bool)

(declare-fun e!61613 () Bool)

(declare-datatypes ((array!4396 0))(
  ( (array!4397 (arr!2612 (Array (_ BitVec 32) (_ BitVec 8))) (size!1995 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3512 0))(
  ( (BitStream!3513 (buf!2365 array!4396) (currentByte!4707 (_ BitVec 32)) (currentBit!4702 (_ BitVec 32))) )
))
(declare-fun thiss!1534 () BitStream!3512)

(declare-fun array_inv!1821 (array!4396) Bool)

(assert (=> b!93834 (= e!61613 (array_inv!1821 (buf!2365 thiss!1534)))))

(declare-fun b!93835 () Bool)

(declare-fun res!77385 () Bool)

(declare-fun e!61617 () Bool)

(assert (=> b!93835 (=> (not res!77385) (not e!61617))))

(declare-datatypes ((List!862 0))(
  ( (Nil!859) (Cons!858 (h!977 Bool) (t!1612 List!862)) )
))
(declare-fun listBits!13 () List!862)

(declare-fun length!453 (List!862) Int)

(assert (=> b!93835 (= res!77385 (> (length!453 listBits!13) 0))))

(declare-fun b!93836 () Bool)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!93836 (= e!61617 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (= listBits!13 Nil!859)))))

(declare-fun res!77386 () Bool)

(assert (=> start!18804 (=> (not res!77386) (not e!61617))))

(assert (=> start!18804 (= res!77386 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18804 e!61617))

(assert (=> start!18804 true))

(declare-fun bitStream1!8 () BitStream!3512)

(declare-fun e!61618 () Bool)

(declare-fun inv!12 (BitStream!3512) Bool)

(assert (=> start!18804 (and (inv!12 bitStream1!8) e!61618)))

(declare-fun bitStream2!8 () BitStream!3512)

(declare-fun e!61612 () Bool)

(assert (=> start!18804 (and (inv!12 bitStream2!8) e!61612)))

(declare-fun base!8 () BitStream!3512)

(declare-fun e!61616 () Bool)

(assert (=> start!18804 (and (inv!12 base!8) e!61616)))

(assert (=> start!18804 (and (inv!12 thiss!1534) e!61613)))

(declare-fun b!93837 () Bool)

(declare-fun res!77394 () Bool)

(assert (=> b!93837 (=> (not res!77394) (not e!61617))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3512 BitStream!3512 (_ BitVec 64)) List!862)

(assert (=> b!93837 (= res!77394 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!93838 () Bool)

(declare-fun res!77384 () Bool)

(assert (=> b!93838 (=> (not res!77384) (not e!61617))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93838 (= res!77384 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8))) (bitIndex!0 (size!1995 (buf!2365 bitStream2!8)) (currentByte!4707 bitStream2!8) (currentBit!4702 bitStream2!8))))))

(declare-fun b!93839 () Bool)

(assert (=> b!93839 (= e!61618 (array_inv!1821 (buf!2365 bitStream1!8)))))

(declare-fun b!93840 () Bool)

(assert (=> b!93840 (= e!61616 (array_inv!1821 (buf!2365 base!8)))))

(declare-fun b!93841 () Bool)

(declare-fun res!77390 () Bool)

(assert (=> b!93841 (=> (not res!77390) (not e!61617))))

(declare-fun isPrefixOf!0 (BitStream!3512 BitStream!3512) Bool)

(assert (=> b!93841 (= res!77390 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93842 () Bool)

(declare-fun res!77387 () Bool)

(assert (=> b!93842 (=> (not res!77387) (not e!61617))))

(assert (=> b!93842 (= res!77387 (bvslt (bitIndex!0 (size!1995 (buf!2365 base!8)) (currentByte!4707 base!8) (currentBit!4702 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93843 () Bool)

(assert (=> b!93843 (= e!61612 (array_inv!1821 (buf!2365 bitStream2!8)))))

(declare-fun b!93844 () Bool)

(declare-fun res!77389 () Bool)

(assert (=> b!93844 (=> (not res!77389) (not e!61617))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93844 (= res!77389 (validate_offset_bits!1 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))) ((_ sign_extend 32) (currentByte!4707 bitStream2!8)) ((_ sign_extend 32) (currentBit!4702 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93845 () Bool)

(declare-fun res!77388 () Bool)

(assert (=> b!93845 (=> (not res!77388) (not e!61617))))

(assert (=> b!93845 (= res!77388 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93846 () Bool)

(declare-fun res!77393 () Bool)

(assert (=> b!93846 (=> (not res!77393) (not e!61617))))

(assert (=> b!93846 (= res!77393 (validate_offset_bits!1 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))) ((_ sign_extend 32) (currentByte!4707 bitStream1!8)) ((_ sign_extend 32) (currentBit!4702 bitStream1!8)) nBits!484))))

(declare-fun b!93847 () Bool)

(declare-fun res!77391 () Bool)

(assert (=> b!93847 (=> (not res!77391) (not e!61617))))

(assert (=> b!93847 (= res!77391 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93848 () Bool)

(declare-fun res!77392 () Bool)

(assert (=> b!93848 (=> (not res!77392) (not e!61617))))

(assert (=> b!93848 (= res!77392 (and (= (buf!2365 bitStream1!8) (buf!2365 bitStream2!8)) (= (buf!2365 bitStream1!8) (buf!2365 base!8))))))

(assert (= (and start!18804 res!77386) b!93835))

(assert (= (and b!93835 res!77385) b!93841))

(assert (= (and b!93841 res!77390) b!93847))

(assert (= (and b!93847 res!77391) b!93845))

(assert (= (and b!93845 res!77388) b!93848))

(assert (= (and b!93848 res!77392) b!93842))

(assert (= (and b!93842 res!77387) b!93838))

(assert (= (and b!93838 res!77384) b!93846))

(assert (= (and b!93846 res!77393) b!93844))

(assert (= (and b!93844 res!77389) b!93837))

(assert (= (and b!93837 res!77394) b!93836))

(assert (= start!18804 b!93839))

(assert (= start!18804 b!93843))

(assert (= start!18804 b!93840))

(assert (= start!18804 b!93834))

(declare-fun m!137549 () Bool)

(assert (=> b!93846 m!137549))

(declare-fun m!137551 () Bool)

(assert (=> b!93835 m!137551))

(declare-fun m!137553 () Bool)

(assert (=> b!93839 m!137553))

(declare-fun m!137555 () Bool)

(assert (=> b!93842 m!137555))

(declare-fun m!137557 () Bool)

(assert (=> b!93841 m!137557))

(declare-fun m!137559 () Bool)

(assert (=> b!93838 m!137559))

(declare-fun m!137561 () Bool)

(assert (=> b!93838 m!137561))

(declare-fun m!137563 () Bool)

(assert (=> b!93844 m!137563))

(declare-fun m!137565 () Bool)

(assert (=> b!93847 m!137565))

(declare-fun m!137567 () Bool)

(assert (=> start!18804 m!137567))

(declare-fun m!137569 () Bool)

(assert (=> start!18804 m!137569))

(declare-fun m!137571 () Bool)

(assert (=> start!18804 m!137571))

(declare-fun m!137573 () Bool)

(assert (=> start!18804 m!137573))

(declare-fun m!137575 () Bool)

(assert (=> b!93837 m!137575))

(declare-fun m!137577 () Bool)

(assert (=> b!93843 m!137577))

(declare-fun m!137579 () Bool)

(assert (=> b!93834 m!137579))

(declare-fun m!137581 () Bool)

(assert (=> b!93845 m!137581))

(declare-fun m!137583 () Bool)

(assert (=> b!93840 m!137583))

(push 1)

(assert (not b!93845))

(assert (not b!93846))

(assert (not b!93838))

(assert (not b!93835))

(assert (not b!93847))

(assert (not b!93841))

(assert (not b!93837))

(assert (not start!18804))

(assert (not b!93844))

(assert (not b!93843))

(assert (not b!93839))

(assert (not b!93840))

(assert (not b!93842))

(assert (not b!93834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29108 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29108 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))) ((_ sign_extend 32) (currentByte!4707 bitStream1!8)) ((_ sign_extend 32) (currentBit!4702 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))) ((_ sign_extend 32) (currentByte!4707 bitStream1!8)) ((_ sign_extend 32) (currentBit!4702 bitStream1!8))) nBits!484))))

(declare-fun bs!7167 () Bool)

(assert (= bs!7167 d!29108))

(declare-fun m!137595 () Bool)

(assert (=> bs!7167 m!137595))

(assert (=> b!93846 d!29108))

(declare-fun d!29110 () Bool)

(declare-fun size!1996 (List!862) Int)

(assert (=> d!29110 (= (length!453 listBits!13) (size!1996 listBits!13))))

(declare-fun bs!7168 () Bool)

(assert (= bs!7168 d!29110))

(declare-fun m!137597 () Bool)

(assert (=> bs!7168 m!137597))

(assert (=> b!93835 d!29110))

(declare-fun d!29112 () Bool)

(declare-fun res!77416 () Bool)

(declare-fun e!61638 () Bool)

(assert (=> d!29112 (=> (not res!77416) (not e!61638))))

(assert (=> d!29112 (= res!77416 (= (size!1995 (buf!2365 bitStream1!8)) (size!1995 (buf!2365 bitStream2!8))))))

(assert (=> d!29112 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61638)))

(declare-fun b!93881 () Bool)

(declare-fun res!77417 () Bool)

(assert (=> b!93881 (=> (not res!77417) (not e!61638))))

(assert (=> b!93881 (= res!77417 (bvsle (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8)) (bitIndex!0 (size!1995 (buf!2365 bitStream2!8)) (currentByte!4707 bitStream2!8) (currentBit!4702 bitStream2!8))))))

(declare-fun b!93882 () Bool)

(declare-fun e!61639 () Bool)

(assert (=> b!93882 (= e!61638 e!61639)))

(declare-fun res!77415 () Bool)

(assert (=> b!93882 (=> res!77415 e!61639)))

(assert (=> b!93882 (= res!77415 (= (size!1995 (buf!2365 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93883 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4396 array!4396 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93883 (= e!61639 (arrayBitRangesEq!0 (buf!2365 bitStream1!8) (buf!2365 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8))))))

(assert (= (and d!29112 res!77416) b!93881))

(assert (= (and b!93881 res!77417) b!93882))

(assert (= (and b!93882 (not res!77415)) b!93883))

(assert (=> b!93881 m!137559))

(assert (=> b!93881 m!137561))

(assert (=> b!93883 m!137559))

(assert (=> b!93883 m!137559))

(declare-fun m!137611 () Bool)

(assert (=> b!93883 m!137611))

(assert (=> b!93845 d!29112))

(declare-fun d!29122 () Bool)

(assert (=> d!29122 (= (array_inv!1821 (buf!2365 thiss!1534)) (bvsge (size!1995 (buf!2365 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!93834 d!29122))

(declare-fun d!29126 () Bool)

(assert (=> d!29126 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))) ((_ sign_extend 32) (currentByte!4707 bitStream2!8)) ((_ sign_extend 32) (currentBit!4702 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))) ((_ sign_extend 32) (currentByte!4707 bitStream2!8)) ((_ sign_extend 32) (currentBit!4702 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7169 () Bool)

(assert (= bs!7169 d!29126))

(declare-fun m!137619 () Bool)

(assert (=> bs!7169 m!137619))

(assert (=> b!93844 d!29126))

(declare-fun d!29130 () Bool)

(declare-fun e!61663 () Bool)

(assert (=> d!29130 e!61663))

(declare-fun res!77456 () Bool)

(assert (=> d!29130 (=> (not res!77456) (not e!61663))))

(declare-fun lt!138567 () (_ BitVec 64))

(declare-fun lt!138562 () (_ BitVec 64))

(declare-fun lt!138564 () (_ BitVec 64))

(assert (=> d!29130 (= res!77456 (= lt!138564 (bvsub lt!138567 lt!138562)))))

(assert (=> d!29130 (or (= (bvand lt!138567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138567 lt!138562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29130 (= lt!138562 (remainingBits!0 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))) ((_ sign_extend 32) (currentByte!4707 bitStream1!8)) ((_ sign_extend 32) (currentBit!4702 bitStream1!8))))))

(declare-fun lt!138566 () (_ BitVec 64))

(declare-fun lt!138563 () (_ BitVec 64))

(assert (=> d!29130 (= lt!138567 (bvmul lt!138566 lt!138563))))

(assert (=> d!29130 (or (= lt!138566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138563 (bvsdiv (bvmul lt!138566 lt!138563) lt!138566)))))

(assert (=> d!29130 (= lt!138563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29130 (= lt!138566 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))))))

(assert (=> d!29130 (= lt!138564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4707 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4702 bitStream1!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29130 (invariant!0 (currentBit!4702 bitStream1!8) (currentByte!4707 bitStream1!8) (size!1995 (buf!2365 bitStream1!8)))))

(assert (=> d!29130 (= (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8)) lt!138564)))

(declare-fun b!93921 () Bool)

(declare-fun res!77455 () Bool)

(assert (=> b!93921 (=> (not res!77455) (not e!61663))))

(assert (=> b!93921 (= res!77455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138564))))

(declare-fun b!93922 () Bool)

(declare-fun lt!138565 () (_ BitVec 64))

(assert (=> b!93922 (= e!61663 (bvsle lt!138564 (bvmul lt!138565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93922 (or (= lt!138565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138565)))))

(assert (=> b!93922 (= lt!138565 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream1!8))))))

(assert (= (and d!29130 res!77456) b!93921))

(assert (= (and b!93921 res!77455) b!93922))

(assert (=> d!29130 m!137595))

(declare-fun m!137643 () Bool)

(assert (=> d!29130 m!137643))

(assert (=> b!93838 d!29130))

(declare-fun d!29180 () Bool)

(declare-fun e!61666 () Bool)

(assert (=> d!29180 e!61666))

(declare-fun res!77461 () Bool)

(assert (=> d!29180 (=> (not res!77461) (not e!61666))))

(declare-fun lt!138573 () (_ BitVec 64))

(declare-fun lt!138570 () (_ BitVec 64))

(declare-fun lt!138568 () (_ BitVec 64))

(assert (=> d!29180 (= res!77461 (= lt!138570 (bvsub lt!138573 lt!138568)))))

(assert (=> d!29180 (or (= (bvand lt!138573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138573 lt!138568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29180 (= lt!138568 (remainingBits!0 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))) ((_ sign_extend 32) (currentByte!4707 bitStream2!8)) ((_ sign_extend 32) (currentBit!4702 bitStream2!8))))))

(declare-fun lt!138572 () (_ BitVec 64))

(declare-fun lt!138569 () (_ BitVec 64))

(assert (=> d!29180 (= lt!138573 (bvmul lt!138572 lt!138569))))

(assert (=> d!29180 (or (= lt!138572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138569 (bvsdiv (bvmul lt!138572 lt!138569) lt!138572)))))

(assert (=> d!29180 (= lt!138569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29180 (= lt!138572 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))))))

(assert (=> d!29180 (= lt!138570 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4707 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4702 bitStream2!8))))))

(assert (=> d!29180 (invariant!0 (currentBit!4702 bitStream2!8) (currentByte!4707 bitStream2!8) (size!1995 (buf!2365 bitStream2!8)))))

(assert (=> d!29180 (= (bitIndex!0 (size!1995 (buf!2365 bitStream2!8)) (currentByte!4707 bitStream2!8) (currentBit!4702 bitStream2!8)) lt!138570)))

(declare-fun b!93926 () Bool)

(declare-fun res!77460 () Bool)

(assert (=> b!93926 (=> (not res!77460) (not e!61666))))

(assert (=> b!93926 (= res!77460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138570))))

(declare-fun b!93927 () Bool)

(declare-fun lt!138571 () (_ BitVec 64))

(assert (=> b!93927 (= e!61666 (bvsle lt!138570 (bvmul lt!138571 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93927 (or (= lt!138571 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138571 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138571)))))

(assert (=> b!93927 (= lt!138571 ((_ sign_extend 32) (size!1995 (buf!2365 bitStream2!8))))))

(assert (= (and d!29180 res!77461) b!93926))

(assert (= (and b!93926 res!77460) b!93927))

(assert (=> d!29180 m!137619))

(declare-fun m!137647 () Bool)

(assert (=> d!29180 m!137647))

(assert (=> b!93838 d!29180))

(declare-fun d!29184 () Bool)

(declare-fun e!61676 () Bool)

(assert (=> d!29184 e!61676))

(declare-fun c!5916 () Bool)

(assert (=> d!29184 (= c!5916 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!138586 () List!862)

(declare-datatypes ((tuple2!7622 0))(
  ( (tuple2!7623 (_1!4058 List!862) (_2!4058 BitStream!3512)) )
))
(declare-fun e!61675 () tuple2!7622)

(assert (=> d!29184 (= lt!138586 (_1!4058 e!61675))))

(declare-fun c!5917 () Bool)

(assert (=> d!29184 (= c!5917 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29184 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29184 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138586)))

(declare-fun lt!138588 () (_ BitVec 64))

(declare-datatypes ((tuple2!7624 0))(
  ( (tuple2!7625 (_1!4059 Bool) (_2!4059 BitStream!3512)) )
))
(declare-fun lt!138587 () tuple2!7624)

(declare-fun b!93945 () Bool)

(assert (=> b!93945 (= e!61675 (tuple2!7623 (Cons!858 (_1!4059 lt!138587) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4059 lt!138587) (bvsub nBits!484 lt!138588))) (_2!4059 lt!138587)))))

(declare-fun readBit!0 (BitStream!3512) tuple2!7624)

(assert (=> b!93945 (= lt!138587 (readBit!0 bitStream1!8))))

(assert (=> b!93945 (= lt!138588 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!93944 () Bool)

(assert (=> b!93944 (= e!61675 (tuple2!7623 Nil!859 bitStream1!8))))

(declare-fun b!93947 () Bool)

(assert (=> b!93947 (= e!61676 (> (length!453 lt!138586) 0))))

(declare-fun b!93946 () Bool)

(declare-fun isEmpty!248 (List!862) Bool)

(assert (=> b!93946 (= e!61676 (isEmpty!248 lt!138586))))

(assert (= (and d!29184 c!5917) b!93944))

(assert (= (and d!29184 (not c!5917)) b!93945))

(assert (= (and d!29184 c!5916) b!93946))

(assert (= (and d!29184 (not c!5916)) b!93947))

(declare-fun m!137649 () Bool)

(assert (=> b!93945 m!137649))

(declare-fun m!137651 () Bool)

(assert (=> b!93945 m!137651))

(declare-fun m!137653 () Bool)

(assert (=> b!93947 m!137653))

(declare-fun m!137655 () Bool)

(assert (=> b!93946 m!137655))

(assert (=> b!93837 d!29184))

(declare-fun d!29186 () Bool)

(declare-fun res!77463 () Bool)

(declare-fun e!61677 () Bool)

(assert (=> d!29186 (=> (not res!77463) (not e!61677))))

(assert (=> d!29186 (= res!77463 (= (size!1995 (buf!2365 bitStream2!8)) (size!1995 (buf!2365 base!8))))))

(assert (=> d!29186 (= (isPrefixOf!0 bitStream2!8 base!8) e!61677)))

(declare-fun b!93948 () Bool)

(declare-fun res!77464 () Bool)

(assert (=> b!93948 (=> (not res!77464) (not e!61677))))

(assert (=> b!93948 (= res!77464 (bvsle (bitIndex!0 (size!1995 (buf!2365 bitStream2!8)) (currentByte!4707 bitStream2!8) (currentBit!4702 bitStream2!8)) (bitIndex!0 (size!1995 (buf!2365 base!8)) (currentByte!4707 base!8) (currentBit!4702 base!8))))))

(declare-fun b!93949 () Bool)

(declare-fun e!61678 () Bool)

(assert (=> b!93949 (= e!61677 e!61678)))

(declare-fun res!77462 () Bool)

(assert (=> b!93949 (=> res!77462 e!61678)))

(assert (=> b!93949 (= res!77462 (= (size!1995 (buf!2365 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93950 () Bool)

(assert (=> b!93950 (= e!61678 (arrayBitRangesEq!0 (buf!2365 bitStream2!8) (buf!2365 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1995 (buf!2365 bitStream2!8)) (currentByte!4707 bitStream2!8) (currentBit!4702 bitStream2!8))))))

(assert (= (and d!29186 res!77463) b!93948))

(assert (= (and b!93948 res!77464) b!93949))

(assert (= (and b!93949 (not res!77462)) b!93950))

(assert (=> b!93948 m!137561))

(assert (=> b!93948 m!137555))

(assert (=> b!93950 m!137561))

(assert (=> b!93950 m!137561))

(declare-fun m!137657 () Bool)

(assert (=> b!93950 m!137657))

(assert (=> b!93847 d!29186))

(declare-fun d!29188 () Bool)

(declare-fun res!77466 () Bool)

(declare-fun e!61679 () Bool)

(assert (=> d!29188 (=> (not res!77466) (not e!61679))))

(assert (=> d!29188 (= res!77466 (= (size!1995 (buf!2365 bitStream1!8)) (size!1995 (buf!2365 base!8))))))

(assert (=> d!29188 (= (isPrefixOf!0 bitStream1!8 base!8) e!61679)))

(declare-fun b!93951 () Bool)

(declare-fun res!77467 () Bool)

(assert (=> b!93951 (=> (not res!77467) (not e!61679))))

(assert (=> b!93951 (= res!77467 (bvsle (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8)) (bitIndex!0 (size!1995 (buf!2365 base!8)) (currentByte!4707 base!8) (currentBit!4702 base!8))))))

(declare-fun b!93952 () Bool)

(declare-fun e!61680 () Bool)

(assert (=> b!93952 (= e!61679 e!61680)))

(declare-fun res!77465 () Bool)

(assert (=> b!93952 (=> res!77465 e!61680)))

(assert (=> b!93952 (= res!77465 (= (size!1995 (buf!2365 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93953 () Bool)

(assert (=> b!93953 (= e!61680 (arrayBitRangesEq!0 (buf!2365 bitStream1!8) (buf!2365 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1995 (buf!2365 bitStream1!8)) (currentByte!4707 bitStream1!8) (currentBit!4702 bitStream1!8))))))

(assert (= (and d!29188 res!77466) b!93951))

(assert (= (and b!93951 res!77467) b!93952))

(assert (= (and b!93952 (not res!77465)) b!93953))

(assert (=> b!93951 m!137559))

(assert (=> b!93951 m!137555))

(assert (=> b!93953 m!137559))

(assert (=> b!93953 m!137559))

(declare-fun m!137659 () Bool)

(assert (=> b!93953 m!137659))

(assert (=> b!93841 d!29188))

(declare-fun d!29190 () Bool)

(assert (=> d!29190 (= (array_inv!1821 (buf!2365 base!8)) (bvsge (size!1995 (buf!2365 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93840 d!29190))

(declare-fun d!29192 () Bool)

(assert (=> d!29192 (= (array_inv!1821 (buf!2365 bitStream1!8)) (bvsge (size!1995 (buf!2365 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93839 d!29192))

(declare-fun d!29194 () Bool)

(assert (=> d!29194 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4702 bitStream1!8) (currentByte!4707 bitStream1!8) (size!1995 (buf!2365 bitStream1!8))))))

(declare-fun bs!7183 () Bool)

(assert (= bs!7183 d!29194))

(assert (=> bs!7183 m!137643))

(assert (=> start!18804 d!29194))

(declare-fun d!29196 () Bool)

(assert (=> d!29196 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4702 bitStream2!8) (currentByte!4707 bitStream2!8) (size!1995 (buf!2365 bitStream2!8))))))

(declare-fun bs!7184 () Bool)

(assert (= bs!7184 d!29196))

(assert (=> bs!7184 m!137647))

(assert (=> start!18804 d!29196))

(declare-fun d!29198 () Bool)

(assert (=> d!29198 (= (inv!12 base!8) (invariant!0 (currentBit!4702 base!8) (currentByte!4707 base!8) (size!1995 (buf!2365 base!8))))))

(declare-fun bs!7185 () Bool)

(assert (= bs!7185 d!29198))

(declare-fun m!137669 () Bool)

(assert (=> bs!7185 m!137669))

(assert (=> start!18804 d!29198))

(declare-fun d!29200 () Bool)

(assert (=> d!29200 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4702 thiss!1534) (currentByte!4707 thiss!1534) (size!1995 (buf!2365 thiss!1534))))))

(declare-fun bs!7186 () Bool)

(assert (= bs!7186 d!29200))

(declare-fun m!137671 () Bool)

(assert (=> bs!7186 m!137671))

(assert (=> start!18804 d!29200))

(declare-fun d!29202 () Bool)

(assert (=> d!29202 (= (array_inv!1821 (buf!2365 bitStream2!8)) (bvsge (size!1995 (buf!2365 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93843 d!29202))

(declare-fun d!29204 () Bool)

(declare-fun e!61683 () Bool)

(assert (=> d!29204 e!61683))

(declare-fun res!77469 () Bool)

(assert (=> d!29204 (=> (not res!77469) (not e!61683))))

(declare-fun lt!138592 () (_ BitVec 64))

(declare-fun lt!138597 () (_ BitVec 64))

(declare-fun lt!138594 () (_ BitVec 64))

(assert (=> d!29204 (= res!77469 (= lt!138594 (bvsub lt!138597 lt!138592)))))

(assert (=> d!29204 (or (= (bvand lt!138597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138597 lt!138592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29204 (= lt!138592 (remainingBits!0 ((_ sign_extend 32) (size!1995 (buf!2365 base!8))) ((_ sign_extend 32) (currentByte!4707 base!8)) ((_ sign_extend 32) (currentBit!4702 base!8))))))

(declare-fun lt!138596 () (_ BitVec 64))

(declare-fun lt!138593 () (_ BitVec 64))

(assert (=> d!29204 (= lt!138597 (bvmul lt!138596 lt!138593))))

(assert (=> d!29204 (or (= lt!138596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138593 (bvsdiv (bvmul lt!138596 lt!138593) lt!138596)))))

(assert (=> d!29204 (= lt!138593 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29204 (= lt!138596 ((_ sign_extend 32) (size!1995 (buf!2365 base!8))))))

(assert (=> d!29204 (= lt!138594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4707 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4702 base!8))))))

(assert (=> d!29204 (invariant!0 (currentBit!4702 base!8) (currentByte!4707 base!8) (size!1995 (buf!2365 base!8)))))

(assert (=> d!29204 (= (bitIndex!0 (size!1995 (buf!2365 base!8)) (currentByte!4707 base!8) (currentBit!4702 base!8)) lt!138594)))

(declare-fun b!93958 () Bool)

(declare-fun res!77468 () Bool)

(assert (=> b!93958 (=> (not res!77468) (not e!61683))))

(assert (=> b!93958 (= res!77468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138594))))

(declare-fun b!93959 () Bool)

(declare-fun lt!138595 () (_ BitVec 64))

(assert (=> b!93959 (= e!61683 (bvsle lt!138594 (bvmul lt!138595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93959 (or (= lt!138595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138595)))))

(assert (=> b!93959 (= lt!138595 ((_ sign_extend 32) (size!1995 (buf!2365 base!8))))))

(assert (= (and d!29204 res!77469) b!93958))

(assert (= (and b!93958 res!77468) b!93959))

(declare-fun m!137673 () Bool)

(assert (=> d!29204 m!137673))

(assert (=> d!29204 m!137669))

(assert (=> b!93842 d!29204))

(push 1)

