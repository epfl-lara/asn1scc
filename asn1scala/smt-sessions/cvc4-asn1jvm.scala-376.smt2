; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8952 () Bool)

(assert start!8952)

(declare-fun b!44424 () Bool)

(declare-fun res!37626 () Bool)

(declare-fun e!29633 () Bool)

(assert (=> b!44424 (=> res!37626 e!29633)))

(declare-datatypes ((array!2243 0))(
  ( (array!2244 (arr!1522 (Array (_ BitVec 32) (_ BitVec 8))) (size!1011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1766 0))(
  ( (BitStream!1767 (buf!1354 array!2243) (currentByte!2835 (_ BitVec 32)) (currentBit!2830 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3164 0))(
  ( (Unit!3165) )
))
(declare-datatypes ((tuple2!4354 0))(
  ( (tuple2!4355 (_1!2270 Unit!3164) (_2!2270 BitStream!1766)) )
))
(declare-fun lt!67793 () tuple2!4354)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!44424 (= res!37626 (not (invariant!0 (currentBit!2830 (_2!2270 lt!67793)) (currentByte!2835 (_2!2270 lt!67793)) (size!1011 (buf!1354 (_2!2270 lt!67793))))))))

(declare-fun e!29628 () Bool)

(declare-fun b!44425 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!67797 () (_ BitVec 64))

(declare-fun lt!67795 () tuple2!4354)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44425 (= e!29628 (= lt!67797 (bvsub (bvsub (bvadd (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44426 () Bool)

(declare-fun e!29626 () Bool)

(declare-fun e!29630 () Bool)

(assert (=> b!44426 (= e!29626 (not e!29630))))

(declare-fun res!37629 () Bool)

(assert (=> b!44426 (=> res!37629 e!29630)))

(assert (=> b!44426 (= res!37629 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1766)

(declare-fun isPrefixOf!0 (BitStream!1766 BitStream!1766) Bool)

(assert (=> b!44426 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67798 () Unit!3164)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1766) Unit!3164)

(assert (=> b!44426 (= lt!67798 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!67796 () (_ BitVec 64))

(assert (=> b!44426 (= lt!67796 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2243)

(declare-fun b!44428 () Bool)

(declare-datatypes ((tuple2!4356 0))(
  ( (tuple2!4357 (_1!2271 BitStream!1766) (_2!2271 BitStream!1766)) )
))
(declare-fun lt!67792 () tuple2!4356)

(declare-fun e!29631 () Bool)

(declare-datatypes ((List!524 0))(
  ( (Nil!521) (Cons!520 (h!639 Bool) (t!1274 List!524)) )
))
(declare-fun head!343 (List!524) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1766 array!2243 (_ BitVec 64) (_ BitVec 64)) List!524)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1766 BitStream!1766 (_ BitVec 64)) List!524)

(assert (=> b!44428 (= e!29631 (= (head!343 (byteArrayBitContentToList!0 (_2!2270 lt!67795) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!343 (bitStreamReadBitsIntoList!0 (_2!2270 lt!67795) (_1!2271 lt!67792) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44429 () Bool)

(declare-fun e!29629 () Bool)

(declare-fun array_inv!936 (array!2243) Bool)

(assert (=> b!44429 (= e!29629 (array_inv!936 (buf!1354 thiss!1379)))))

(declare-fun b!44430 () Bool)

(declare-fun res!37633 () Bool)

(assert (=> b!44430 (=> (not res!37633) (not e!29626))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44430 (= res!37633 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44431 () Bool)

(assert (=> b!44431 (= e!29633 (= (size!1011 (buf!1354 (_2!2270 lt!67795))) (size!1011 (buf!1354 (_2!2270 lt!67793)))))))

(assert (=> b!44431 e!29628))

(declare-fun res!37635 () Bool)

(assert (=> b!44431 (=> (not res!37635) (not e!29628))))

(assert (=> b!44431 (= res!37635 (= (size!1011 (buf!1354 (_2!2270 lt!67793))) (size!1011 (buf!1354 thiss!1379))))))

(declare-fun b!44432 () Bool)

(declare-fun e!29627 () Bool)

(declare-fun e!29624 () Bool)

(assert (=> b!44432 (= e!29627 e!29624)))

(declare-fun res!37628 () Bool)

(assert (=> b!44432 (=> res!37628 e!29624)))

(assert (=> b!44432 (= res!37628 (not (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!67793))))))

(assert (=> b!44432 (isPrefixOf!0 thiss!1379 (_2!2270 lt!67793))))

(declare-fun lt!67791 () Unit!3164)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1766 BitStream!1766 BitStream!1766) Unit!3164)

(assert (=> b!44432 (= lt!67791 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2270 lt!67795) (_2!2270 lt!67793)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1766 array!2243 (_ BitVec 64) (_ BitVec 64)) tuple2!4354)

(assert (=> b!44432 (= lt!67793 (appendBitsMSBFirstLoop!0 (_2!2270 lt!67795) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!44432 e!29631))

(declare-fun res!37632 () Bool)

(assert (=> b!44432 (=> (not res!37632) (not e!29631))))

(assert (=> b!44432 (= res!37632 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67790 () Unit!3164)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1766 array!2243 (_ BitVec 64)) Unit!3164)

(assert (=> b!44432 (= lt!67790 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1354 (_2!2270 lt!67795)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1766 BitStream!1766) tuple2!4356)

(assert (=> b!44432 (= lt!67792 (reader!0 thiss!1379 (_2!2270 lt!67795)))))

(declare-fun res!37627 () Bool)

(assert (=> start!8952 (=> (not res!37627) (not e!29626))))

(assert (=> start!8952 (= res!37627 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1011 srcBuffer!2))))))))

(assert (=> start!8952 e!29626))

(assert (=> start!8952 true))

(assert (=> start!8952 (array_inv!936 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1766) Bool)

(assert (=> start!8952 (and (inv!12 thiss!1379) e!29629)))

(declare-fun b!44427 () Bool)

(assert (=> b!44427 (= e!29630 e!29627)))

(declare-fun res!37634 () Bool)

(assert (=> b!44427 (=> res!37634 e!29627)))

(assert (=> b!44427 (= res!37634 (not (isPrefixOf!0 thiss!1379 (_2!2270 lt!67795))))))

(assert (=> b!44427 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67794 () Unit!3164)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1766 BitStream!1766 (_ BitVec 64) (_ BitVec 64)) Unit!3164)

(assert (=> b!44427 (= lt!67794 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2270 lt!67795) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1766 (_ BitVec 8) (_ BitVec 32)) tuple2!4354)

(assert (=> b!44427 (= lt!67795 (appendBitFromByte!0 thiss!1379 (select (arr!1522 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44433 () Bool)

(declare-fun res!37631 () Bool)

(assert (=> b!44433 (=> res!37631 e!29633)))

(assert (=> b!44433 (= res!37631 (not (= (size!1011 (buf!1354 thiss!1379)) (size!1011 (buf!1354 (_2!2270 lt!67793))))))))

(declare-fun b!44434 () Bool)

(assert (=> b!44434 (= e!29624 e!29633)))

(declare-fun res!37630 () Bool)

(assert (=> b!44434 (=> res!37630 e!29633)))

(assert (=> b!44434 (= res!37630 (not (= lt!67797 (bvsub (bvadd lt!67796 to!314) i!635))))))

(assert (=> b!44434 (= lt!67797 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67793))) (currentByte!2835 (_2!2270 lt!67793)) (currentBit!2830 (_2!2270 lt!67793))))))

(assert (= (and start!8952 res!37627) b!44430))

(assert (= (and b!44430 res!37633) b!44426))

(assert (= (and b!44426 (not res!37629)) b!44427))

(assert (= (and b!44427 (not res!37634)) b!44432))

(assert (= (and b!44432 res!37632) b!44428))

(assert (= (and b!44432 (not res!37628)) b!44434))

(assert (= (and b!44434 (not res!37630)) b!44424))

(assert (= (and b!44424 (not res!37626)) b!44433))

(assert (= (and b!44433 (not res!37631)) b!44431))

(assert (= (and b!44431 res!37635) b!44425))

(assert (= start!8952 b!44429))

(declare-fun m!67755 () Bool)

(assert (=> start!8952 m!67755))

(declare-fun m!67757 () Bool)

(assert (=> start!8952 m!67757))

(declare-fun m!67759 () Bool)

(assert (=> b!44432 m!67759))

(declare-fun m!67761 () Bool)

(assert (=> b!44432 m!67761))

(declare-fun m!67763 () Bool)

(assert (=> b!44432 m!67763))

(declare-fun m!67765 () Bool)

(assert (=> b!44432 m!67765))

(declare-fun m!67767 () Bool)

(assert (=> b!44432 m!67767))

(declare-fun m!67769 () Bool)

(assert (=> b!44432 m!67769))

(declare-fun m!67771 () Bool)

(assert (=> b!44432 m!67771))

(declare-fun m!67773 () Bool)

(assert (=> b!44427 m!67773))

(declare-fun m!67775 () Bool)

(assert (=> b!44427 m!67775))

(declare-fun m!67777 () Bool)

(assert (=> b!44427 m!67777))

(assert (=> b!44427 m!67773))

(declare-fun m!67779 () Bool)

(assert (=> b!44427 m!67779))

(declare-fun m!67781 () Bool)

(assert (=> b!44427 m!67781))

(declare-fun m!67783 () Bool)

(assert (=> b!44424 m!67783))

(declare-fun m!67785 () Bool)

(assert (=> b!44430 m!67785))

(declare-fun m!67787 () Bool)

(assert (=> b!44426 m!67787))

(declare-fun m!67789 () Bool)

(assert (=> b!44426 m!67789))

(declare-fun m!67791 () Bool)

(assert (=> b!44426 m!67791))

(declare-fun m!67793 () Bool)

(assert (=> b!44429 m!67793))

(declare-fun m!67795 () Bool)

(assert (=> b!44425 m!67795))

(declare-fun m!67797 () Bool)

(assert (=> b!44434 m!67797))

(declare-fun m!67799 () Bool)

(assert (=> b!44428 m!67799))

(assert (=> b!44428 m!67799))

(declare-fun m!67801 () Bool)

(assert (=> b!44428 m!67801))

(declare-fun m!67803 () Bool)

(assert (=> b!44428 m!67803))

(assert (=> b!44428 m!67803))

(declare-fun m!67805 () Bool)

(assert (=> b!44428 m!67805))

(push 1)

(assert (not b!44432))

(assert (not b!44430))

(assert (not start!8952))

(assert (not b!44425))

(assert (not b!44426))

(assert (not b!44429))

(assert (not b!44434))

(assert (not b!44427))

(assert (not b!44428))

(assert (not b!44424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12924 () Bool)

(declare-fun res!37676 () Bool)

(declare-fun e!29661 () Bool)

(assert (=> d!12924 (=> (not res!37676) (not e!29661))))

(assert (=> d!12924 (= res!37676 (= (size!1011 (buf!1354 thiss!1379)) (size!1011 (buf!1354 thiss!1379))))))

(assert (=> d!12924 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29661)))

(declare-fun b!44475 () Bool)

(declare-fun res!37678 () Bool)

(assert (=> b!44475 (=> (not res!37678) (not e!29661))))

(assert (=> b!44475 (= res!37678 (bvsle (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)) (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379))))))

(declare-fun b!44476 () Bool)

(declare-fun e!29660 () Bool)

(assert (=> b!44476 (= e!29661 e!29660)))

(declare-fun res!37677 () Bool)

(assert (=> b!44476 (=> res!37677 e!29660)))

(assert (=> b!44476 (= res!37677 (= (size!1011 (buf!1354 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44477 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2243 array!2243 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44477 (= e!29660 (arrayBitRangesEq!0 (buf!1354 thiss!1379) (buf!1354 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379))))))

(assert (= (and d!12924 res!37676) b!44475))

(assert (= (and b!44475 res!37678) b!44476))

(assert (= (and b!44476 (not res!37677)) b!44477))

(assert (=> b!44475 m!67791))

(assert (=> b!44475 m!67791))

(assert (=> b!44477 m!67791))

(assert (=> b!44477 m!67791))

(declare-fun m!67831 () Bool)

(assert (=> b!44477 m!67831))

(assert (=> b!44426 d!12924))

(declare-fun d!12932 () Bool)

(assert (=> d!12932 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67837 () Unit!3164)

(declare-fun choose!11 (BitStream!1766) Unit!3164)

(assert (=> d!12932 (= lt!67837 (choose!11 thiss!1379))))

(assert (=> d!12932 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!67837)))

(declare-fun bs!3452 () Bool)

(assert (= bs!3452 d!12932))

(assert (=> bs!3452 m!67787))

(declare-fun m!67833 () Bool)

(assert (=> bs!3452 m!67833))

(assert (=> b!44426 d!12932))

(declare-fun d!12934 () Bool)

(declare-fun e!29672 () Bool)

(assert (=> d!12934 e!29672))

(declare-fun res!37699 () Bool)

(assert (=> d!12934 (=> (not res!37699) (not e!29672))))

(declare-fun lt!67874 () (_ BitVec 64))

(declare-fun lt!67875 () (_ BitVec 64))

(declare-fun lt!67878 () (_ BitVec 64))

(assert (=> d!12934 (= res!37699 (= lt!67875 (bvsub lt!67878 lt!67874)))))

(assert (=> d!12934 (or (= (bvand lt!67878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67878 lt!67874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12934 (= lt!67874 (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379))))))

(declare-fun lt!67879 () (_ BitVec 64))

(declare-fun lt!67877 () (_ BitVec 64))

(assert (=> d!12934 (= lt!67878 (bvmul lt!67879 lt!67877))))

(assert (=> d!12934 (or (= lt!67879 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67877 (bvsdiv (bvmul lt!67879 lt!67877) lt!67879)))))

(assert (=> d!12934 (= lt!67877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12934 (= lt!67879 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))))))

(assert (=> d!12934 (= lt!67875 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2835 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2830 thiss!1379))))))

(assert (=> d!12934 (invariant!0 (currentBit!2830 thiss!1379) (currentByte!2835 thiss!1379) (size!1011 (buf!1354 thiss!1379)))))

(assert (=> d!12934 (= (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)) lt!67875)))

(declare-fun b!44499 () Bool)

(declare-fun res!37700 () Bool)

(assert (=> b!44499 (=> (not res!37700) (not e!29672))))

(assert (=> b!44499 (= res!37700 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67875))))

(declare-fun b!44500 () Bool)

(declare-fun lt!67876 () (_ BitVec 64))

(assert (=> b!44500 (= e!29672 (bvsle lt!67875 (bvmul lt!67876 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44500 (or (= lt!67876 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67876 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67876)))))

(assert (=> b!44500 (= lt!67876 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))))))

(assert (= (and d!12934 res!37699) b!44499))

(assert (= (and b!44499 res!37700) b!44500))

(declare-fun m!67835 () Bool)

(assert (=> d!12934 m!67835))

(declare-fun m!67837 () Bool)

(assert (=> d!12934 m!67837))

(assert (=> b!44426 d!12934))

(declare-fun d!12936 () Bool)

(assert (=> d!12936 (= (array_inv!936 srcBuffer!2) (bvsge (size!1011 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8952 d!12936))

(declare-fun d!12938 () Bool)

(assert (=> d!12938 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2830 thiss!1379) (currentByte!2835 thiss!1379) (size!1011 (buf!1354 thiss!1379))))))

(declare-fun bs!3453 () Bool)

(assert (= bs!3453 d!12938))

(assert (=> bs!3453 m!67837))

(assert (=> start!8952 d!12938))

(declare-fun d!12940 () Bool)

(assert (=> d!12940 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 thiss!1379))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3454 () Bool)

(assert (= bs!3454 d!12940))

(assert (=> bs!3454 m!67835))

(assert (=> b!44430 d!12940))

(declare-fun d!12942 () Bool)

(declare-fun e!29677 () Bool)

(assert (=> d!12942 e!29677))

(declare-fun res!37709 () Bool)

(assert (=> d!12942 (=> (not res!37709) (not e!29677))))

(declare-fun lt!67892 () (_ BitVec 64))

(declare-fun lt!67896 () (_ BitVec 64))

(declare-fun lt!67893 () (_ BitVec 64))

(assert (=> d!12942 (= res!37709 (= lt!67893 (bvsub lt!67896 lt!67892)))))

(assert (=> d!12942 (or (= (bvand lt!67896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67896 lt!67892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12942 (= lt!67892 (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795)))))))

(declare-fun lt!67897 () (_ BitVec 64))

(declare-fun lt!67895 () (_ BitVec 64))

(assert (=> d!12942 (= lt!67896 (bvmul lt!67897 lt!67895))))

(assert (=> d!12942 (or (= lt!67897 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67895 (bvsdiv (bvmul lt!67897 lt!67895) lt!67897)))))

(assert (=> d!12942 (= lt!67895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12942 (= lt!67897 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))))))

(assert (=> d!12942 (= lt!67893 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795)))))))

(assert (=> d!12942 (invariant!0 (currentBit!2830 (_2!2270 lt!67795)) (currentByte!2835 (_2!2270 lt!67795)) (size!1011 (buf!1354 (_2!2270 lt!67795))))))

(assert (=> d!12942 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))) lt!67893)))

(declare-fun b!44509 () Bool)

(declare-fun res!37710 () Bool)

(assert (=> b!44509 (=> (not res!37710) (not e!29677))))

(assert (=> b!44509 (= res!37710 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67893))))

(declare-fun b!44510 () Bool)

(declare-fun lt!67894 () (_ BitVec 64))

(assert (=> b!44510 (= e!29677 (bvsle lt!67893 (bvmul lt!67894 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44510 (or (= lt!67894 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67894 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67894)))))

(assert (=> b!44510 (= lt!67894 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))))))

(assert (= (and d!12942 res!37709) b!44509))

(assert (= (and b!44509 res!37710) b!44510))

(declare-fun m!67839 () Bool)

(assert (=> d!12942 m!67839))

(declare-fun m!67841 () Bool)

(assert (=> d!12942 m!67841))

(assert (=> b!44425 d!12942))

(declare-fun d!12944 () Bool)

(assert (=> d!12944 (= (invariant!0 (currentBit!2830 (_2!2270 lt!67793)) (currentByte!2835 (_2!2270 lt!67793)) (size!1011 (buf!1354 (_2!2270 lt!67793)))) (and (bvsge (currentBit!2830 (_2!2270 lt!67793)) #b00000000000000000000000000000000) (bvslt (currentBit!2830 (_2!2270 lt!67793)) #b00000000000000000000000000001000) (bvsge (currentByte!2835 (_2!2270 lt!67793)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2835 (_2!2270 lt!67793)) (size!1011 (buf!1354 (_2!2270 lt!67793)))) (and (= (currentBit!2830 (_2!2270 lt!67793)) #b00000000000000000000000000000000) (= (currentByte!2835 (_2!2270 lt!67793)) (size!1011 (buf!1354 (_2!2270 lt!67793))))))))))

(assert (=> b!44424 d!12944))

(declare-fun d!12946 () Bool)

(declare-fun e!29678 () Bool)

(assert (=> d!12946 e!29678))

(declare-fun res!37711 () Bool)

(assert (=> d!12946 (=> (not res!37711) (not e!29678))))

(declare-fun lt!67898 () (_ BitVec 64))

(declare-fun lt!67902 () (_ BitVec 64))

(declare-fun lt!67899 () (_ BitVec 64))

(assert (=> d!12946 (= res!37711 (= lt!67899 (bvsub lt!67902 lt!67898)))))

(assert (=> d!12946 (or (= (bvand lt!67902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67902 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67902 lt!67898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12946 (= lt!67898 (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67793)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67793))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67793)))))))

(declare-fun lt!67903 () (_ BitVec 64))

(declare-fun lt!67901 () (_ BitVec 64))

(assert (=> d!12946 (= lt!67902 (bvmul lt!67903 lt!67901))))

(assert (=> d!12946 (or (= lt!67903 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!67901 (bvsdiv (bvmul lt!67903 lt!67901) lt!67903)))))

(assert (=> d!12946 (= lt!67901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12946 (= lt!67903 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67793)))))))

(assert (=> d!12946 (= lt!67899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67793))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67793)))))))

(assert (=> d!12946 (invariant!0 (currentBit!2830 (_2!2270 lt!67793)) (currentByte!2835 (_2!2270 lt!67793)) (size!1011 (buf!1354 (_2!2270 lt!67793))))))

(assert (=> d!12946 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67793))) (currentByte!2835 (_2!2270 lt!67793)) (currentBit!2830 (_2!2270 lt!67793))) lt!67899)))

(declare-fun b!44511 () Bool)

(declare-fun res!37712 () Bool)

(assert (=> b!44511 (=> (not res!37712) (not e!29678))))

(assert (=> b!44511 (= res!37712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!67899))))

(declare-fun b!44512 () Bool)

(declare-fun lt!67900 () (_ BitVec 64))

(assert (=> b!44512 (= e!29678 (bvsle lt!67899 (bvmul lt!67900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44512 (or (= lt!67900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!67900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!67900)))))

(assert (=> b!44512 (= lt!67900 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67793)))))))

(assert (= (and d!12946 res!37711) b!44511))

(assert (= (and b!44511 res!37712) b!44512))

(declare-fun m!67871 () Bool)

(assert (=> d!12946 m!67871))

(assert (=> d!12946 m!67783))

(assert (=> b!44434 d!12946))

(declare-fun d!12950 () Bool)

(assert (=> d!12950 (= (array_inv!936 (buf!1354 thiss!1379)) (bvsge (size!1011 (buf!1354 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!44429 d!12950))

(declare-fun d!12952 () Bool)

(assert (=> d!12952 (= (head!343 (byteArrayBitContentToList!0 (_2!2270 lt!67795) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!639 (byteArrayBitContentToList!0 (_2!2270 lt!67795) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44428 d!12952))

(declare-fun d!12956 () Bool)

(declare-fun c!2966 () Bool)

(assert (=> d!12956 (= c!2966 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29688 () List!524)

(assert (=> d!12956 (= (byteArrayBitContentToList!0 (_2!2270 lt!67795) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29688)))

(declare-fun b!44533 () Bool)

(assert (=> b!44533 (= e!29688 Nil!521)))

(declare-fun b!44534 () Bool)

(assert (=> b!44534 (= e!29688 (Cons!520 (not (= (bvand ((_ sign_extend 24) (select (arr!1522 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2270 lt!67795) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12956 c!2966) b!44533))

(assert (= (and d!12956 (not c!2966)) b!44534))

(assert (=> b!44534 m!67773))

(declare-fun m!67875 () Bool)

(assert (=> b!44534 m!67875))

(declare-fun m!67877 () Bool)

(assert (=> b!44534 m!67877))

(assert (=> b!44428 d!12956))

(declare-fun d!12960 () Bool)

(assert (=> d!12960 (= (head!343 (bitStreamReadBitsIntoList!0 (_2!2270 lt!67795) (_1!2271 lt!67792) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!639 (bitStreamReadBitsIntoList!0 (_2!2270 lt!67795) (_1!2271 lt!67792) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!44428 d!12960))

(declare-fun b!44558 () Bool)

(declare-fun e!29700 () Bool)

(declare-fun lt!67982 () List!524)

(declare-fun isEmpty!126 (List!524) Bool)

(assert (=> b!44558 (= e!29700 (isEmpty!126 lt!67982))))

(declare-fun b!44559 () Bool)

(declare-fun length!224 (List!524) Int)

(assert (=> b!44559 (= e!29700 (> (length!224 lt!67982) 0))))

(declare-fun d!12964 () Bool)

(assert (=> d!12964 e!29700))

(declare-fun c!2977 () Bool)

(assert (=> d!12964 (= c!2977 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4368 0))(
  ( (tuple2!4369 (_1!2277 List!524) (_2!2277 BitStream!1766)) )
))
(declare-fun e!29699 () tuple2!4368)

(assert (=> d!12964 (= lt!67982 (_1!2277 e!29699))))

(declare-fun c!2976 () Bool)

(assert (=> d!12964 (= c!2976 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12964 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12964 (= (bitStreamReadBitsIntoList!0 (_2!2270 lt!67795) (_1!2271 lt!67792) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67982)))

(declare-fun b!44556 () Bool)

(assert (=> b!44556 (= e!29699 (tuple2!4369 Nil!521 (_1!2271 lt!67792)))))

(declare-datatypes ((tuple2!4370 0))(
  ( (tuple2!4371 (_1!2278 Bool) (_2!2278 BitStream!1766)) )
))
(declare-fun lt!67983 () tuple2!4370)

(declare-fun b!44557 () Bool)

(declare-fun lt!67984 () (_ BitVec 64))

(assert (=> b!44557 (= e!29699 (tuple2!4369 (Cons!520 (_1!2278 lt!67983) (bitStreamReadBitsIntoList!0 (_2!2270 lt!67795) (_2!2278 lt!67983) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!67984))) (_2!2278 lt!67983)))))

(declare-fun readBit!0 (BitStream!1766) tuple2!4370)

(assert (=> b!44557 (= lt!67983 (readBit!0 (_1!2271 lt!67792)))))

(assert (=> b!44557 (= lt!67984 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!12964 c!2976) b!44556))

(assert (= (and d!12964 (not c!2976)) b!44557))

(assert (= (and d!12964 c!2977) b!44558))

(assert (= (and d!12964 (not c!2977)) b!44559))

(declare-fun m!67909 () Bool)

(assert (=> b!44558 m!67909))

(declare-fun m!67911 () Bool)

(assert (=> b!44559 m!67911))

(declare-fun m!67913 () Bool)

(assert (=> b!44557 m!67913))

(declare-fun m!67915 () Bool)

(assert (=> b!44557 m!67915))

(assert (=> b!44428 d!12964))

(declare-fun d!12972 () Bool)

(declare-fun res!37722 () Bool)

(declare-fun e!29704 () Bool)

(assert (=> d!12972 (=> (not res!37722) (not e!29704))))

(assert (=> d!12972 (= res!37722 (= (size!1011 (buf!1354 (_2!2270 lt!67795))) (size!1011 (buf!1354 (_2!2270 lt!67793)))))))

(assert (=> d!12972 (= (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!67793)) e!29704)))

(declare-fun b!44564 () Bool)

(declare-fun res!37724 () Bool)

(assert (=> b!44564 (=> (not res!37724) (not e!29704))))

(assert (=> b!44564 (= res!37724 (bvsle (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))) (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67793))) (currentByte!2835 (_2!2270 lt!67793)) (currentBit!2830 (_2!2270 lt!67793)))))))

(declare-fun b!44565 () Bool)

(declare-fun e!29703 () Bool)

(assert (=> b!44565 (= e!29704 e!29703)))

(declare-fun res!37723 () Bool)

(assert (=> b!44565 (=> res!37723 e!29703)))

(assert (=> b!44565 (= res!37723 (= (size!1011 (buf!1354 (_2!2270 lt!67795))) #b00000000000000000000000000000000))))

(declare-fun b!44566 () Bool)

(assert (=> b!44566 (= e!29703 (arrayBitRangesEq!0 (buf!1354 (_2!2270 lt!67795)) (buf!1354 (_2!2270 lt!67793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795)))))))

(assert (= (and d!12972 res!37722) b!44564))

(assert (= (and b!44564 res!37724) b!44565))

(assert (= (and b!44565 (not res!37723)) b!44566))

(assert (=> b!44564 m!67795))

(assert (=> b!44564 m!67797))

(assert (=> b!44566 m!67795))

(assert (=> b!44566 m!67795))

(declare-fun m!67925 () Bool)

(assert (=> b!44566 m!67925))

(assert (=> b!44432 d!12972))

(declare-fun d!12976 () Bool)

(declare-fun res!37725 () Bool)

(declare-fun e!29706 () Bool)

(assert (=> d!12976 (=> (not res!37725) (not e!29706))))

(assert (=> d!12976 (= res!37725 (= (size!1011 (buf!1354 thiss!1379)) (size!1011 (buf!1354 (_2!2270 lt!67793)))))))

(assert (=> d!12976 (= (isPrefixOf!0 thiss!1379 (_2!2270 lt!67793)) e!29706)))

(declare-fun b!44567 () Bool)

(declare-fun res!37727 () Bool)

(assert (=> b!44567 (=> (not res!37727) (not e!29706))))

(assert (=> b!44567 (= res!37727 (bvsle (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)) (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67793))) (currentByte!2835 (_2!2270 lt!67793)) (currentBit!2830 (_2!2270 lt!67793)))))))

(declare-fun b!44568 () Bool)

(declare-fun e!29705 () Bool)

(assert (=> b!44568 (= e!29706 e!29705)))

(declare-fun res!37726 () Bool)

(assert (=> b!44568 (=> res!37726 e!29705)))

(assert (=> b!44568 (= res!37726 (= (size!1011 (buf!1354 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44569 () Bool)

(assert (=> b!44569 (= e!29705 (arrayBitRangesEq!0 (buf!1354 thiss!1379) (buf!1354 (_2!2270 lt!67793)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379))))))

(assert (= (and d!12976 res!37725) b!44567))

(assert (= (and b!44567 res!37727) b!44568))

(assert (= (and b!44568 (not res!37726)) b!44569))

(assert (=> b!44567 m!67791))

(assert (=> b!44567 m!67797))

(assert (=> b!44569 m!67791))

(assert (=> b!44569 m!67791))

(declare-fun m!67927 () Bool)

(assert (=> b!44569 m!67927))

(assert (=> b!44432 d!12976))

(declare-fun d!12978 () Bool)

(assert (=> d!12978 (isPrefixOf!0 thiss!1379 (_2!2270 lt!67793))))

(declare-fun lt!67990 () Unit!3164)

(declare-fun choose!30 (BitStream!1766 BitStream!1766 BitStream!1766) Unit!3164)

(assert (=> d!12978 (= lt!67990 (choose!30 thiss!1379 (_2!2270 lt!67795) (_2!2270 lt!67793)))))

(assert (=> d!12978 (isPrefixOf!0 thiss!1379 (_2!2270 lt!67795))))

(assert (=> d!12978 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2270 lt!67795) (_2!2270 lt!67793)) lt!67990)))

(declare-fun bs!3457 () Bool)

(assert (= bs!3457 d!12978))

(assert (=> bs!3457 m!67761))

(declare-fun m!67929 () Bool)

(assert (=> bs!3457 m!67929))

(assert (=> bs!3457 m!67781))

(assert (=> b!44432 d!12978))

(declare-fun b!44593 () Bool)

(declare-fun res!37749 () Bool)

(declare-fun e!29719 () Bool)

(assert (=> b!44593 (=> (not res!37749) (not e!29719))))

(declare-fun lt!68077 () tuple2!4356)

(assert (=> b!44593 (= res!37749 (isPrefixOf!0 (_2!2271 lt!68077) (_2!2270 lt!67795)))))

(declare-fun lt!68066 () (_ BitVec 64))

(declare-fun lt!68067 () (_ BitVec 64))

(declare-fun b!44594 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1766 (_ BitVec 64)) BitStream!1766)

(assert (=> b!44594 (= e!29719 (= (_1!2271 lt!68077) (withMovedBitIndex!0 (_2!2271 lt!68077) (bvsub lt!68066 lt!68067))))))

(assert (=> b!44594 (or (= (bvand lt!68066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68066 lt!68067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44594 (= lt!68067 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))))))

(assert (=> b!44594 (= lt!68066 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)))))

(declare-fun b!44595 () Bool)

(declare-fun e!29718 () Unit!3164)

(declare-fun Unit!3181 () Unit!3164)

(assert (=> b!44595 (= e!29718 Unit!3181)))

(declare-fun b!44596 () Bool)

(declare-fun res!37748 () Bool)

(assert (=> b!44596 (=> (not res!37748) (not e!29719))))

(assert (=> b!44596 (= res!37748 (isPrefixOf!0 (_1!2271 lt!68077) thiss!1379))))

(declare-fun b!44597 () Bool)

(declare-fun lt!68075 () Unit!3164)

(assert (=> b!44597 (= e!29718 lt!68075)))

(declare-fun lt!68083 () (_ BitVec 64))

(assert (=> b!44597 (= lt!68083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!68072 () (_ BitVec 64))

(assert (=> b!44597 (= lt!68072 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2243 array!2243 (_ BitVec 64) (_ BitVec 64)) Unit!3164)

(assert (=> b!44597 (= lt!68075 (arrayBitRangesEqSymmetric!0 (buf!1354 thiss!1379) (buf!1354 (_2!2270 lt!67795)) lt!68083 lt!68072))))

(assert (=> b!44597 (arrayBitRangesEq!0 (buf!1354 (_2!2270 lt!67795)) (buf!1354 thiss!1379) lt!68083 lt!68072)))

(declare-fun d!12980 () Bool)

(assert (=> d!12980 e!29719))

(declare-fun res!37747 () Bool)

(assert (=> d!12980 (=> (not res!37747) (not e!29719))))

(assert (=> d!12980 (= res!37747 (isPrefixOf!0 (_1!2271 lt!68077) (_2!2271 lt!68077)))))

(declare-fun lt!68081 () BitStream!1766)

(assert (=> d!12980 (= lt!68077 (tuple2!4357 lt!68081 (_2!2270 lt!67795)))))

(declare-fun lt!68078 () Unit!3164)

(declare-fun lt!68074 () Unit!3164)

(assert (=> d!12980 (= lt!68078 lt!68074)))

(assert (=> d!12980 (isPrefixOf!0 lt!68081 (_2!2270 lt!67795))))

(assert (=> d!12980 (= lt!68074 (lemmaIsPrefixTransitive!0 lt!68081 (_2!2270 lt!67795) (_2!2270 lt!67795)))))

(declare-fun lt!68070 () Unit!3164)

(declare-fun lt!68076 () Unit!3164)

(assert (=> d!12980 (= lt!68070 lt!68076)))

(assert (=> d!12980 (isPrefixOf!0 lt!68081 (_2!2270 lt!67795))))

(assert (=> d!12980 (= lt!68076 (lemmaIsPrefixTransitive!0 lt!68081 thiss!1379 (_2!2270 lt!67795)))))

(declare-fun lt!68071 () Unit!3164)

(assert (=> d!12980 (= lt!68071 e!29718)))

(declare-fun c!2982 () Bool)

(assert (=> d!12980 (= c!2982 (not (= (size!1011 (buf!1354 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!68073 () Unit!3164)

(declare-fun lt!68080 () Unit!3164)

(assert (=> d!12980 (= lt!68073 lt!68080)))

(assert (=> d!12980 (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!67795))))

(assert (=> d!12980 (= lt!68080 (lemmaIsPrefixRefl!0 (_2!2270 lt!67795)))))

(declare-fun lt!68079 () Unit!3164)

(declare-fun lt!68064 () Unit!3164)

(assert (=> d!12980 (= lt!68079 lt!68064)))

(assert (=> d!12980 (= lt!68064 (lemmaIsPrefixRefl!0 (_2!2270 lt!67795)))))

(declare-fun lt!68065 () Unit!3164)

(declare-fun lt!68069 () Unit!3164)

(assert (=> d!12980 (= lt!68065 lt!68069)))

(assert (=> d!12980 (isPrefixOf!0 lt!68081 lt!68081)))

(assert (=> d!12980 (= lt!68069 (lemmaIsPrefixRefl!0 lt!68081))))

(declare-fun lt!68068 () Unit!3164)

(declare-fun lt!68082 () Unit!3164)

(assert (=> d!12980 (= lt!68068 lt!68082)))

(assert (=> d!12980 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12980 (= lt!68082 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12980 (= lt!68081 (BitStream!1767 (buf!1354 (_2!2270 lt!67795)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)))))

(assert (=> d!12980 (isPrefixOf!0 thiss!1379 (_2!2270 lt!67795))))

(assert (=> d!12980 (= (reader!0 thiss!1379 (_2!2270 lt!67795)) lt!68077)))

(assert (= (and d!12980 c!2982) b!44597))

(assert (= (and d!12980 (not c!2982)) b!44595))

(assert (= (and d!12980 res!37747) b!44596))

(assert (= (and b!44596 res!37748) b!44593))

(assert (= (and b!44593 res!37749) b!44594))

(declare-fun m!67943 () Bool)

(assert (=> b!44593 m!67943))

(declare-fun m!67945 () Bool)

(assert (=> b!44594 m!67945))

(assert (=> b!44594 m!67795))

(assert (=> b!44594 m!67791))

(declare-fun m!67947 () Bool)

(assert (=> d!12980 m!67947))

(declare-fun m!67949 () Bool)

(assert (=> d!12980 m!67949))

(declare-fun m!67951 () Bool)

(assert (=> d!12980 m!67951))

(declare-fun m!67953 () Bool)

(assert (=> d!12980 m!67953))

(assert (=> d!12980 m!67789))

(assert (=> d!12980 m!67787))

(assert (=> d!12980 m!67781))

(declare-fun m!67955 () Bool)

(assert (=> d!12980 m!67955))

(declare-fun m!67957 () Bool)

(assert (=> d!12980 m!67957))

(declare-fun m!67959 () Bool)

(assert (=> d!12980 m!67959))

(declare-fun m!67961 () Bool)

(assert (=> d!12980 m!67961))

(assert (=> b!44597 m!67791))

(declare-fun m!67963 () Bool)

(assert (=> b!44597 m!67963))

(declare-fun m!67965 () Bool)

(assert (=> b!44597 m!67965))

(declare-fun m!67967 () Bool)

(assert (=> b!44596 m!67967))

(assert (=> b!44432 d!12980))

(declare-fun b!44665 () Bool)

(declare-fun e!29752 () Bool)

(declare-fun lt!68329 () (_ BitVec 64))

(assert (=> b!44665 (= e!29752 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) lt!68329))))

(declare-fun b!44666 () Bool)

(declare-fun res!37792 () Bool)

(declare-fun e!29753 () Bool)

(assert (=> b!44666 (=> (not res!37792) (not e!29753))))

(declare-fun lt!68348 () tuple2!4354)

(assert (=> b!44666 (= res!37792 (= (size!1011 (buf!1354 (_2!2270 lt!68348))) (size!1011 (buf!1354 (_2!2270 lt!67795)))))))

(declare-fun b!44667 () Bool)

(declare-fun lt!68361 () tuple2!4356)

(assert (=> b!44667 (= e!29753 (= (bitStreamReadBitsIntoList!0 (_2!2270 lt!68348) (_1!2271 lt!68361) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2270 lt!68348) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44667 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44667 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68331 () Unit!3164)

(declare-fun lt!68359 () Unit!3164)

(assert (=> b!44667 (= lt!68331 lt!68359)))

(assert (=> b!44667 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!68348)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) lt!68329)))

(assert (=> b!44667 (= lt!68359 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2270 lt!67795) (buf!1354 (_2!2270 lt!68348)) lt!68329))))

(assert (=> b!44667 e!29752))

(declare-fun res!37794 () Bool)

(assert (=> b!44667 (=> (not res!37794) (not e!29752))))

(assert (=> b!44667 (= res!37794 (and (= (size!1011 (buf!1354 (_2!2270 lt!67795))) (size!1011 (buf!1354 (_2!2270 lt!68348)))) (bvsge lt!68329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44667 (= lt!68329 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44667 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44667 (= lt!68361 (reader!0 (_2!2270 lt!67795) (_2!2270 lt!68348)))))

(declare-fun b!44668 () Bool)

(declare-fun e!29751 () tuple2!4354)

(declare-fun Unit!3183 () Unit!3164)

(assert (=> b!44668 (= e!29751 (tuple2!4355 Unit!3183 (_2!2270 lt!67795)))))

(assert (=> b!44668 (= (size!1011 (buf!1354 (_2!2270 lt!67795))) (size!1011 (buf!1354 (_2!2270 lt!67795))))))

(declare-fun lt!68344 () Unit!3164)

(declare-fun Unit!3184 () Unit!3164)

(assert (=> b!44668 (= lt!68344 Unit!3184)))

(declare-fun call!532 () tuple2!4356)

(declare-fun checkByteArrayBitContent!0 (BitStream!1766 array!2243 array!2243 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4378 0))(
  ( (tuple2!4379 (_1!2282 array!2243) (_2!2282 BitStream!1766)) )
))
(declare-fun readBits!0 (BitStream!1766 (_ BitVec 64)) tuple2!4378)

(assert (=> b!44668 (checkByteArrayBitContent!0 (_2!2270 lt!67795) srcBuffer!2 (_1!2282 (readBits!0 (_1!2271 call!532) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!44669 () Bool)

(declare-fun lt!68334 () tuple2!4354)

(declare-fun Unit!3185 () Unit!3164)

(assert (=> b!44669 (= e!29751 (tuple2!4355 Unit!3185 (_2!2270 lt!68334)))))

(declare-fun lt!68337 () tuple2!4354)

(assert (=> b!44669 (= lt!68337 (appendBitFromByte!0 (_2!2270 lt!67795) (select (arr!1522 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!68347 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68347 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68356 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68356 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68339 () Unit!3164)

(assert (=> b!44669 (= lt!68339 (validateOffsetBitsIneqLemma!0 (_2!2270 lt!67795) (_2!2270 lt!68337) lt!68347 lt!68356))))

(assert (=> b!44669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!68337)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!68337))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!68337))) (bvsub lt!68347 lt!68356))))

(declare-fun lt!68324 () Unit!3164)

(assert (=> b!44669 (= lt!68324 lt!68339)))

(declare-fun lt!68333 () tuple2!4356)

(assert (=> b!44669 (= lt!68333 call!532)))

(declare-fun lt!68358 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68358 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68345 () Unit!3164)

(assert (=> b!44669 (= lt!68345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2270 lt!67795) (buf!1354 (_2!2270 lt!68337)) lt!68358))))

(assert (=> b!44669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!68337)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) lt!68358)))

(declare-fun lt!68365 () Unit!3164)

(assert (=> b!44669 (= lt!68365 lt!68345)))

(assert (=> b!44669 (= (head!343 (byteArrayBitContentToList!0 (_2!2270 lt!68337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!343 (bitStreamReadBitsIntoList!0 (_2!2270 lt!68337) (_1!2271 lt!68333) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68330 () Unit!3164)

(declare-fun Unit!3186 () Unit!3164)

(assert (=> b!44669 (= lt!68330 Unit!3186)))

(assert (=> b!44669 (= lt!68334 (appendBitsMSBFirstLoop!0 (_2!2270 lt!68337) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!68332 () Unit!3164)

(assert (=> b!44669 (= lt!68332 (lemmaIsPrefixTransitive!0 (_2!2270 lt!67795) (_2!2270 lt!68337) (_2!2270 lt!68334)))))

(assert (=> b!44669 (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!68334))))

(declare-fun lt!68343 () Unit!3164)

(assert (=> b!44669 (= lt!68343 lt!68332)))

(assert (=> b!44669 (= (size!1011 (buf!1354 (_2!2270 lt!68334))) (size!1011 (buf!1354 (_2!2270 lt!67795))))))

(declare-fun lt!68336 () Unit!3164)

(declare-fun Unit!3187 () Unit!3164)

(assert (=> b!44669 (= lt!68336 Unit!3187)))

(assert (=> b!44669 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68334))) (currentByte!2835 (_2!2270 lt!68334)) (currentBit!2830 (_2!2270 lt!68334))) (bvsub (bvadd (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68360 () Unit!3164)

(declare-fun Unit!3188 () Unit!3164)

(assert (=> b!44669 (= lt!68360 Unit!3188)))

(assert (=> b!44669 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68334))) (currentByte!2835 (_2!2270 lt!68334)) (currentBit!2830 (_2!2270 lt!68334))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68337))) (currentByte!2835 (_2!2270 lt!68337)) (currentBit!2830 (_2!2270 lt!68337))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68355 () Unit!3164)

(declare-fun Unit!3189 () Unit!3164)

(assert (=> b!44669 (= lt!68355 Unit!3189)))

(declare-fun lt!68328 () tuple2!4356)

(assert (=> b!44669 (= lt!68328 (reader!0 (_2!2270 lt!67795) (_2!2270 lt!68334)))))

(declare-fun lt!68342 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68342 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68349 () Unit!3164)

(assert (=> b!44669 (= lt!68349 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2270 lt!67795) (buf!1354 (_2!2270 lt!68334)) lt!68342))))

(assert (=> b!44669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!68334)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) lt!68342)))

(declare-fun lt!68341 () Unit!3164)

(assert (=> b!44669 (= lt!68341 lt!68349)))

(declare-fun lt!68353 () tuple2!4356)

(assert (=> b!44669 (= lt!68353 (reader!0 (_2!2270 lt!68337) (_2!2270 lt!68334)))))

(declare-fun lt!68335 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68335 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!68327 () Unit!3164)

(assert (=> b!44669 (= lt!68327 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2270 lt!68337) (buf!1354 (_2!2270 lt!68334)) lt!68335))))

(assert (=> b!44669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!68334)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!68337))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!68337))) lt!68335)))

(declare-fun lt!68363 () Unit!3164)

(assert (=> b!44669 (= lt!68363 lt!68327)))

(declare-fun lt!68351 () List!524)

(assert (=> b!44669 (= lt!68351 (byteArrayBitContentToList!0 (_2!2270 lt!68334) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68325 () List!524)

(assert (=> b!44669 (= lt!68325 (byteArrayBitContentToList!0 (_2!2270 lt!68334) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68338 () List!524)

(assert (=> b!44669 (= lt!68338 (bitStreamReadBitsIntoList!0 (_2!2270 lt!68334) (_1!2271 lt!68328) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!68340 () List!524)

(assert (=> b!44669 (= lt!68340 (bitStreamReadBitsIntoList!0 (_2!2270 lt!68334) (_1!2271 lt!68353) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!68362 () (_ BitVec 64))

(assert (=> b!44669 (= lt!68362 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!68350 () Unit!3164)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1766 BitStream!1766 BitStream!1766 BitStream!1766 (_ BitVec 64) List!524) Unit!3164)

(assert (=> b!44669 (= lt!68350 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2270 lt!68334) (_2!2270 lt!68334) (_1!2271 lt!68328) (_1!2271 lt!68353) lt!68362 lt!68338))))

(declare-fun tail!216 (List!524) List!524)

(assert (=> b!44669 (= (bitStreamReadBitsIntoList!0 (_2!2270 lt!68334) (_1!2271 lt!68353) (bvsub lt!68362 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!216 lt!68338))))

(declare-fun lt!68346 () Unit!3164)

(assert (=> b!44669 (= lt!68346 lt!68350)))

(declare-fun lt!68352 () Unit!3164)

(declare-fun lt!68357 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2243 array!2243 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3164)

(assert (=> b!44669 (= lt!68352 (arrayBitRangesEqImpliesEq!0 (buf!1354 (_2!2270 lt!68337)) (buf!1354 (_2!2270 lt!68334)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!68357 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68337))) (currentByte!2835 (_2!2270 lt!68337)) (currentBit!2830 (_2!2270 lt!68337)))))))

(declare-fun bitAt!0 (array!2243 (_ BitVec 64)) Bool)

(assert (=> b!44669 (= (bitAt!0 (buf!1354 (_2!2270 lt!68337)) lt!68357) (bitAt!0 (buf!1354 (_2!2270 lt!68334)) lt!68357))))

(declare-fun lt!68326 () Unit!3164)

(assert (=> b!44669 (= lt!68326 lt!68352)))

(declare-fun d!12998 () Bool)

(assert (=> d!12998 e!29753))

(declare-fun res!37790 () Bool)

(assert (=> d!12998 (=> (not res!37790) (not e!29753))))

(declare-fun lt!68366 () (_ BitVec 64))

(assert (=> d!12998 (= res!37790 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68348))) (currentByte!2835 (_2!2270 lt!68348)) (currentBit!2830 (_2!2270 lt!68348))) (bvsub lt!68366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12998 (or (= (bvand lt!68366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!68366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!68366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!68354 () (_ BitVec 64))

(assert (=> d!12998 (= lt!68366 (bvadd lt!68354 to!314))))

(assert (=> d!12998 (or (not (= (bvand lt!68354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68354 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12998 (= lt!68354 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))))))

(assert (=> d!12998 (= lt!68348 e!29751)))

(declare-fun c!2997 () Bool)

(assert (=> d!12998 (= c!2997 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!68364 () Unit!3164)

(declare-fun lt!68367 () Unit!3164)

(assert (=> d!12998 (= lt!68364 lt!68367)))

(assert (=> d!12998 (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!67795))))

(assert (=> d!12998 (= lt!68367 (lemmaIsPrefixRefl!0 (_2!2270 lt!67795)))))

(assert (=> d!12998 (= lt!68357 (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795))))))

(assert (=> d!12998 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12998 (= (appendBitsMSBFirstLoop!0 (_2!2270 lt!67795) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!68348)))

(declare-fun b!44670 () Bool)

(declare-fun res!37793 () Bool)

(assert (=> b!44670 (=> (not res!37793) (not e!29753))))

(assert (=> b!44670 (= res!37793 (= (size!1011 (buf!1354 (_2!2270 lt!67795))) (size!1011 (buf!1354 (_2!2270 lt!68348)))))))

(declare-fun b!44671 () Bool)

(declare-fun res!37789 () Bool)

(assert (=> b!44671 (=> (not res!37789) (not e!29753))))

(assert (=> b!44671 (= res!37789 (isPrefixOf!0 (_2!2270 lt!67795) (_2!2270 lt!68348)))))

(declare-fun b!44672 () Bool)

(declare-fun res!37791 () Bool)

(assert (=> b!44672 (=> (not res!37791) (not e!29753))))

(assert (=> b!44672 (= res!37791 (invariant!0 (currentBit!2830 (_2!2270 lt!68348)) (currentByte!2835 (_2!2270 lt!68348)) (size!1011 (buf!1354 (_2!2270 lt!68348)))))))

(declare-fun bm!529 () Bool)

(assert (=> bm!529 (= call!532 (reader!0 (_2!2270 lt!67795) (ite c!2997 (_2!2270 lt!68337) (_2!2270 lt!67795))))))

(assert (= (and d!12998 c!2997) b!44669))

(assert (= (and d!12998 (not c!2997)) b!44668))

(assert (= (or b!44669 b!44668) bm!529))

(assert (= (and d!12998 res!37790) b!44672))

(assert (= (and b!44672 res!37791) b!44670))

(assert (= (and b!44670 res!37793) b!44671))

(assert (= (and b!44671 res!37789) b!44666))

(assert (= (and b!44666 res!37792) b!44667))

(assert (= (and b!44667 res!37794) b!44665))

(declare-fun m!68075 () Bool)

(assert (=> b!44671 m!68075))

(declare-fun m!68077 () Bool)

(assert (=> b!44672 m!68077))

(declare-fun m!68079 () Bool)

(assert (=> b!44667 m!68079))

(declare-fun m!68081 () Bool)

(assert (=> b!44667 m!68081))

(declare-fun m!68083 () Bool)

(assert (=> b!44667 m!68083))

(declare-fun m!68085 () Bool)

(assert (=> b!44667 m!68085))

(declare-fun m!68087 () Bool)

(assert (=> b!44667 m!68087))

(declare-fun m!68089 () Bool)

(assert (=> b!44665 m!68089))

(declare-fun m!68091 () Bool)

(assert (=> bm!529 m!68091))

(declare-fun m!68093 () Bool)

(assert (=> d!12998 m!68093))

(assert (=> d!12998 m!67795))

(assert (=> d!12998 m!67955))

(assert (=> d!12998 m!67961))

(declare-fun m!68095 () Bool)

(assert (=> b!44668 m!68095))

(declare-fun m!68097 () Bool)

(assert (=> b!44668 m!68097))

(declare-fun m!68099 () Bool)

(assert (=> b!44669 m!68099))

(declare-fun m!68101 () Bool)

(assert (=> b!44669 m!68101))

(declare-fun m!68103 () Bool)

(assert (=> b!44669 m!68103))

(declare-fun m!68105 () Bool)

(assert (=> b!44669 m!68105))

(declare-fun m!68107 () Bool)

(assert (=> b!44669 m!68107))

(declare-fun m!68109 () Bool)

(assert (=> b!44669 m!68109))

(declare-fun m!68111 () Bool)

(assert (=> b!44669 m!68111))

(declare-fun m!68113 () Bool)

(assert (=> b!44669 m!68113))

(declare-fun m!68115 () Bool)

(assert (=> b!44669 m!68115))

(declare-fun m!68117 () Bool)

(assert (=> b!44669 m!68117))

(declare-fun m!68119 () Bool)

(assert (=> b!44669 m!68119))

(declare-fun m!68121 () Bool)

(assert (=> b!44669 m!68121))

(declare-fun m!68123 () Bool)

(assert (=> b!44669 m!68123))

(declare-fun m!68125 () Bool)

(assert (=> b!44669 m!68125))

(declare-fun m!68127 () Bool)

(assert (=> b!44669 m!68127))

(declare-fun m!68129 () Bool)

(assert (=> b!44669 m!68129))

(declare-fun m!68131 () Bool)

(assert (=> b!44669 m!68131))

(declare-fun m!68133 () Bool)

(assert (=> b!44669 m!68133))

(declare-fun m!68135 () Bool)

(assert (=> b!44669 m!68135))

(assert (=> b!44669 m!68119))

(assert (=> b!44669 m!68105))

(declare-fun m!68137 () Bool)

(assert (=> b!44669 m!68137))

(assert (=> b!44669 m!67795))

(declare-fun m!68139 () Bool)

(assert (=> b!44669 m!68139))

(declare-fun m!68141 () Bool)

(assert (=> b!44669 m!68141))

(declare-fun m!68143 () Bool)

(assert (=> b!44669 m!68143))

(declare-fun m!68145 () Bool)

(assert (=> b!44669 m!68145))

(assert (=> b!44669 m!68143))

(declare-fun m!68147 () Bool)

(assert (=> b!44669 m!68147))

(declare-fun m!68149 () Bool)

(assert (=> b!44669 m!68149))

(declare-fun m!68151 () Bool)

(assert (=> b!44669 m!68151))

(declare-fun m!68153 () Bool)

(assert (=> b!44669 m!68153))

(declare-fun m!68155 () Bool)

(assert (=> b!44669 m!68155))

(declare-fun m!68157 () Bool)

(assert (=> b!44669 m!68157))

(declare-fun m!68159 () Bool)

(assert (=> b!44669 m!68159))

(assert (=> b!44669 m!68113))

(assert (=> b!44432 d!12998))

(declare-fun d!13022 () Bool)

(assert (=> d!13022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3464 () Bool)

(assert (= bs!3464 d!13022))

(declare-fun m!68161 () Bool)

(assert (=> bs!3464 m!68161))

(assert (=> b!44432 d!13022))

(declare-fun d!13024 () Bool)

(assert (=> d!13024 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 thiss!1379)) ((_ sign_extend 32) (currentBit!2830 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!68438 () Unit!3164)

(declare-fun choose!9 (BitStream!1766 array!2243 (_ BitVec 64) BitStream!1766) Unit!3164)

(assert (=> d!13024 (= lt!68438 (choose!9 thiss!1379 (buf!1354 (_2!2270 lt!67795)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1767 (buf!1354 (_2!2270 lt!67795)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379))))))

(assert (=> d!13024 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1354 (_2!2270 lt!67795)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68438)))

(declare-fun bs!3465 () Bool)

(assert (= bs!3465 d!13024))

(assert (=> bs!3465 m!67767))

(declare-fun m!68163 () Bool)

(assert (=> bs!3465 m!68163))

(assert (=> b!44432 d!13024))

(declare-fun d!13026 () Bool)

(declare-fun res!37795 () Bool)

(declare-fun e!29757 () Bool)

(assert (=> d!13026 (=> (not res!37795) (not e!29757))))

(assert (=> d!13026 (= res!37795 (= (size!1011 (buf!1354 thiss!1379)) (size!1011 (buf!1354 (_2!2270 lt!67795)))))))

(assert (=> d!13026 (= (isPrefixOf!0 thiss!1379 (_2!2270 lt!67795)) e!29757)))

(declare-fun b!44677 () Bool)

(declare-fun res!37797 () Bool)

(assert (=> b!44677 (=> (not res!37797) (not e!29757))))

(assert (=> b!44677 (= res!37797 (bvsle (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)) (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!67795))) (currentByte!2835 (_2!2270 lt!67795)) (currentBit!2830 (_2!2270 lt!67795)))))))

(declare-fun b!44678 () Bool)

(declare-fun e!29756 () Bool)

(assert (=> b!44678 (= e!29757 e!29756)))

(declare-fun res!37796 () Bool)

(assert (=> b!44678 (=> res!37796 e!29756)))

(assert (=> b!44678 (= res!37796 (= (size!1011 (buf!1354 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44679 () Bool)

(assert (=> b!44679 (= e!29756 (arrayBitRangesEq!0 (buf!1354 thiss!1379) (buf!1354 (_2!2270 lt!67795)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379))))))

(assert (= (and d!13026 res!37795) b!44677))

(assert (= (and b!44677 res!37797) b!44678))

(assert (= (and b!44678 (not res!37796)) b!44679))

(assert (=> b!44677 m!67791))

(assert (=> b!44677 m!67795))

(assert (=> b!44679 m!67791))

(assert (=> b!44679 m!67791))

(declare-fun m!68165 () Bool)

(assert (=> b!44679 m!68165))

(assert (=> b!44427 d!13026))

(declare-fun d!13028 () Bool)

(assert (=> d!13028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3466 () Bool)

(assert (= bs!3466 d!13028))

(assert (=> bs!3466 m!67839))

(assert (=> b!44427 d!13028))

(declare-fun d!13030 () Bool)

(declare-fun e!29764 () Bool)

(assert (=> d!13030 e!29764))

(declare-fun res!37812 () Bool)

(assert (=> d!13030 (=> (not res!37812) (not e!29764))))

(assert (=> d!13030 (= res!37812 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!68453 () Unit!3164)

(declare-fun choose!27 (BitStream!1766 BitStream!1766 (_ BitVec 64) (_ BitVec 64)) Unit!3164)

(assert (=> d!13030 (= lt!68453 (choose!27 thiss!1379 (_2!2270 lt!67795) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13030 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13030 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2270 lt!67795) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!68453)))

(declare-fun b!44694 () Bool)

(assert (=> b!44694 (= e!29764 (validate_offset_bits!1 ((_ sign_extend 32) (size!1011 (buf!1354 (_2!2270 lt!67795)))) ((_ sign_extend 32) (currentByte!2835 (_2!2270 lt!67795))) ((_ sign_extend 32) (currentBit!2830 (_2!2270 lt!67795))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13030 res!37812) b!44694))

(declare-fun m!68167 () Bool)

(assert (=> d!13030 m!68167))

(assert (=> b!44694 m!67777))

(assert (=> b!44427 d!13030))

(declare-fun b!44766 () Bool)

(declare-fun res!37877 () Bool)

(declare-fun e!29801 () Bool)

(assert (=> b!44766 (=> (not res!37877) (not e!29801))))

(declare-fun lt!68634 () (_ BitVec 64))

(declare-fun lt!68631 () tuple2!4354)

(declare-fun lt!68630 () (_ BitVec 64))

(assert (=> b!44766 (= res!37877 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68631))) (currentByte!2835 (_2!2270 lt!68631)) (currentBit!2830 (_2!2270 lt!68631))) (bvadd lt!68634 lt!68630)))))

(assert (=> b!44766 (or (not (= (bvand lt!68634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!68630 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!68634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!68634 lt!68630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44766 (= lt!68630 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44766 (= lt!68634 (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)))))

(declare-fun b!44767 () Bool)

(declare-fun e!29799 () Bool)

(declare-datatypes ((tuple2!4380 0))(
  ( (tuple2!4381 (_1!2283 BitStream!1766) (_2!2283 Bool)) )
))
(declare-fun lt!68625 () tuple2!4380)

(declare-fun lt!68627 () tuple2!4354)

(assert (=> b!44767 (= e!29799 (= (bitIndex!0 (size!1011 (buf!1354 (_1!2283 lt!68625))) (currentByte!2835 (_1!2283 lt!68625)) (currentBit!2830 (_1!2283 lt!68625))) (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68627))) (currentByte!2835 (_2!2270 lt!68627)) (currentBit!2830 (_2!2270 lt!68627)))))))

(declare-fun b!44768 () Bool)

(declare-fun res!37879 () Bool)

(declare-fun e!29800 () Bool)

(assert (=> b!44768 (=> (not res!37879) (not e!29800))))

(assert (=> b!44768 (= res!37879 (= (bitIndex!0 (size!1011 (buf!1354 (_2!2270 lt!68627))) (currentByte!2835 (_2!2270 lt!68627)) (currentBit!2830 (_2!2270 lt!68627))) (bvadd (bitIndex!0 (size!1011 (buf!1354 thiss!1379)) (currentByte!2835 thiss!1379) (currentBit!2830 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44769 () Bool)

(declare-fun res!37876 () Bool)

(assert (=> b!44769 (=> (not res!37876) (not e!29800))))

(assert (=> b!44769 (= res!37876 (isPrefixOf!0 thiss!1379 (_2!2270 lt!68627)))))

(declare-fun b!44770 () Bool)

(declare-fun res!37874 () Bool)

(assert (=> b!44770 (=> (not res!37874) (not e!29801))))

(assert (=> b!44770 (= res!37874 (isPrefixOf!0 thiss!1379 (_2!2270 lt!68631)))))

(declare-fun b!44771 () Bool)

(declare-fun e!29798 () Bool)

