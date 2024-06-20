; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8098 () Bool)

(assert start!8098)

(declare-fun b!40814 () Bool)

(declare-fun e!26923 () Bool)

(declare-fun e!26922 () Bool)

(assert (=> b!40814 (= e!26923 (not e!26922))))

(declare-fun res!34737 () Bool)

(assert (=> b!40814 (=> res!34737 e!26922)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40814 (= res!34737 (bvslt i!635 to!314))))

(declare-datatypes ((array!2020 0))(
  ( (array!2021 (arr!1413 (Array (_ BitVec 32) (_ BitVec 8))) (size!914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1572 0))(
  ( (BitStream!1573 (buf!1242 array!2020) (currentByte!2660 (_ BitVec 32)) (currentBit!2655 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1572)

(declare-fun isPrefixOf!0 (BitStream!1572 BitStream!1572) Bool)

(assert (=> b!40814 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2873 0))(
  ( (Unit!2874) )
))
(declare-fun lt!61998 () Unit!2873)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1572) Unit!2873)

(assert (=> b!40814 (= lt!61998 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!61999 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40814 (= lt!61999 (bitIndex!0 (size!914 (buf!1242 thiss!1379)) (currentByte!2660 thiss!1379) (currentBit!2655 thiss!1379)))))

(declare-fun b!40815 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40815 (= e!26922 (invariant!0 (currentBit!2655 thiss!1379) (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379))))))

(declare-fun res!34736 () Bool)

(assert (=> start!8098 (=> (not res!34736) (not e!26923))))

(declare-fun srcBuffer!2 () array!2020)

(assert (=> start!8098 (= res!34736 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!914 srcBuffer!2))))))))

(assert (=> start!8098 e!26923))

(assert (=> start!8098 true))

(declare-fun array_inv!839 (array!2020) Bool)

(assert (=> start!8098 (array_inv!839 srcBuffer!2)))

(declare-fun e!26926 () Bool)

(declare-fun inv!12 (BitStream!1572) Bool)

(assert (=> start!8098 (and (inv!12 thiss!1379) e!26926)))

(declare-fun b!40816 () Bool)

(assert (=> b!40816 (= e!26926 (array_inv!839 (buf!1242 thiss!1379)))))

(declare-fun b!40813 () Bool)

(declare-fun res!34735 () Bool)

(assert (=> b!40813 (=> (not res!34735) (not e!26923))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40813 (= res!34735 (validate_offset_bits!1 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))) ((_ sign_extend 32) (currentByte!2660 thiss!1379)) ((_ sign_extend 32) (currentBit!2655 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8098 res!34736) b!40813))

(assert (= (and b!40813 res!34735) b!40814))

(assert (= (and b!40814 (not res!34737)) b!40815))

(assert (= start!8098 b!40816))

(declare-fun m!62473 () Bool)

(assert (=> b!40815 m!62473))

(declare-fun m!62475 () Bool)

(assert (=> b!40816 m!62475))

(declare-fun m!62477 () Bool)

(assert (=> b!40814 m!62477))

(declare-fun m!62479 () Bool)

(assert (=> b!40814 m!62479))

(declare-fun m!62481 () Bool)

(assert (=> b!40814 m!62481))

(declare-fun m!62483 () Bool)

(assert (=> start!8098 m!62483))

(declare-fun m!62485 () Bool)

(assert (=> start!8098 m!62485))

(declare-fun m!62487 () Bool)

(assert (=> b!40813 m!62487))

(check-sat (not b!40816) (not start!8098) (not b!40814) (not b!40813) (not b!40815))
(check-sat)
(get-model)

(declare-fun d!11932 () Bool)

(declare-fun res!34754 () Bool)

(declare-fun e!26947 () Bool)

(assert (=> d!11932 (=> (not res!34754) (not e!26947))))

(assert (=> d!11932 (= res!34754 (= (size!914 (buf!1242 thiss!1379)) (size!914 (buf!1242 thiss!1379))))))

(assert (=> d!11932 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!26947)))

(declare-fun b!40835 () Bool)

(declare-fun res!34755 () Bool)

(assert (=> b!40835 (=> (not res!34755) (not e!26947))))

(assert (=> b!40835 (= res!34755 (bvsle (bitIndex!0 (size!914 (buf!1242 thiss!1379)) (currentByte!2660 thiss!1379) (currentBit!2655 thiss!1379)) (bitIndex!0 (size!914 (buf!1242 thiss!1379)) (currentByte!2660 thiss!1379) (currentBit!2655 thiss!1379))))))

(declare-fun b!40836 () Bool)

(declare-fun e!26946 () Bool)

(assert (=> b!40836 (= e!26947 e!26946)))

(declare-fun res!34753 () Bool)

(assert (=> b!40836 (=> res!34753 e!26946)))

(assert (=> b!40836 (= res!34753 (= (size!914 (buf!1242 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!40837 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2020 array!2020 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40837 (= e!26946 (arrayBitRangesEq!0 (buf!1242 thiss!1379) (buf!1242 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!914 (buf!1242 thiss!1379)) (currentByte!2660 thiss!1379) (currentBit!2655 thiss!1379))))))

(assert (= (and d!11932 res!34754) b!40835))

(assert (= (and b!40835 res!34755) b!40836))

(assert (= (and b!40836 (not res!34753)) b!40837))

(assert (=> b!40835 m!62481))

(assert (=> b!40835 m!62481))

(assert (=> b!40837 m!62481))

(assert (=> b!40837 m!62481))

(declare-fun m!62505 () Bool)

(assert (=> b!40837 m!62505))

(assert (=> b!40814 d!11932))

(declare-fun d!11934 () Bool)

(assert (=> d!11934 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62008 () Unit!2873)

(declare-fun choose!11 (BitStream!1572) Unit!2873)

(assert (=> d!11934 (= lt!62008 (choose!11 thiss!1379))))

(assert (=> d!11934 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62008)))

(declare-fun bs!3174 () Bool)

(assert (= bs!3174 d!11934))

(assert (=> bs!3174 m!62477))

(declare-fun m!62507 () Bool)

(assert (=> bs!3174 m!62507))

(assert (=> b!40814 d!11934))

(declare-fun d!11938 () Bool)

(declare-fun e!26956 () Bool)

(assert (=> d!11938 e!26956))

(declare-fun res!34770 () Bool)

(assert (=> d!11938 (=> (not res!34770) (not e!26956))))

(declare-fun lt!62028 () (_ BitVec 64))

(declare-fun lt!62026 () (_ BitVec 64))

(declare-fun lt!62029 () (_ BitVec 64))

(assert (=> d!11938 (= res!34770 (= lt!62029 (bvsub lt!62026 lt!62028)))))

(assert (=> d!11938 (or (= (bvand lt!62026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62026 lt!62028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11938 (= lt!62028 (remainingBits!0 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))) ((_ sign_extend 32) (currentByte!2660 thiss!1379)) ((_ sign_extend 32) (currentBit!2655 thiss!1379))))))

(declare-fun lt!62027 () (_ BitVec 64))

(declare-fun lt!62025 () (_ BitVec 64))

(assert (=> d!11938 (= lt!62026 (bvmul lt!62027 lt!62025))))

(assert (=> d!11938 (or (= lt!62027 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62025 (bvsdiv (bvmul lt!62027 lt!62025) lt!62027)))))

(assert (=> d!11938 (= lt!62025 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11938 (= lt!62027 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))))))

(assert (=> d!11938 (= lt!62029 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2660 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2655 thiss!1379))))))

(assert (=> d!11938 (invariant!0 (currentBit!2655 thiss!1379) (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379)))))

(assert (=> d!11938 (= (bitIndex!0 (size!914 (buf!1242 thiss!1379)) (currentByte!2660 thiss!1379) (currentBit!2655 thiss!1379)) lt!62029)))

(declare-fun b!40851 () Bool)

(declare-fun res!34769 () Bool)

(assert (=> b!40851 (=> (not res!34769) (not e!26956))))

(assert (=> b!40851 (= res!34769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62029))))

(declare-fun b!40852 () Bool)

(declare-fun lt!62024 () (_ BitVec 64))

(assert (=> b!40852 (= e!26956 (bvsle lt!62029 (bvmul lt!62024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40852 (or (= lt!62024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62024)))))

(assert (=> b!40852 (= lt!62024 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))))))

(assert (= (and d!11938 res!34770) b!40851))

(assert (= (and b!40851 res!34769) b!40852))

(declare-fun m!62513 () Bool)

(assert (=> d!11938 m!62513))

(assert (=> d!11938 m!62473))

(assert (=> b!40814 d!11938))

(declare-fun d!11950 () Bool)

(assert (=> d!11950 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))) ((_ sign_extend 32) (currentByte!2660 thiss!1379)) ((_ sign_extend 32) (currentBit!2655 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!914 (buf!1242 thiss!1379))) ((_ sign_extend 32) (currentByte!2660 thiss!1379)) ((_ sign_extend 32) (currentBit!2655 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3178 () Bool)

(assert (= bs!3178 d!11950))

(assert (=> bs!3178 m!62513))

(assert (=> b!40813 d!11950))

(declare-fun d!11952 () Bool)

(assert (=> d!11952 (= (invariant!0 (currentBit!2655 thiss!1379) (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379))) (and (bvsge (currentBit!2655 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2655 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2660 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379))) (and (= (currentBit!2655 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379)))))))))

(assert (=> b!40815 d!11952))

(declare-fun d!11954 () Bool)

(assert (=> d!11954 (= (array_inv!839 srcBuffer!2) (bvsge (size!914 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8098 d!11954))

(declare-fun d!11956 () Bool)

(assert (=> d!11956 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2655 thiss!1379) (currentByte!2660 thiss!1379) (size!914 (buf!1242 thiss!1379))))))

(declare-fun bs!3179 () Bool)

(assert (= bs!3179 d!11956))

(assert (=> bs!3179 m!62473))

(assert (=> start!8098 d!11956))

(declare-fun d!11958 () Bool)

(assert (=> d!11958 (= (array_inv!839 (buf!1242 thiss!1379)) (bvsge (size!914 (buf!1242 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!40816 d!11958))

(check-sat (not d!11950) (not b!40837) (not d!11956) (not d!11934) (not d!11938) (not b!40835))
