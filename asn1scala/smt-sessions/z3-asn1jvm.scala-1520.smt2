; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42496 () Bool)

(assert start!42496)

(declare-fun res!167960 () Bool)

(declare-fun e!137608 () Bool)

(assert (=> start!42496 (=> (not res!167960) (not e!137608))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42496 (= res!167960 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42496 e!137608))

(assert (=> start!42496 true))

(declare-datatypes ((array!10156 0))(
  ( (array!10157 (arr!5402 (Array (_ BitVec 32) (_ BitVec 8))) (size!4472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8052 0))(
  ( (BitStream!8053 (buf!4973 array!10156) (currentByte!9353 (_ BitVec 32)) (currentBit!9348 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8052)

(declare-fun e!137609 () Bool)

(declare-fun inv!12 (BitStream!8052) Bool)

(assert (=> start!42496 (and (inv!12 thiss!1204) e!137609)))

(declare-fun b!200622 () Bool)

(declare-fun res!167964 () Bool)

(assert (=> b!200622 (=> (not res!167964) (not e!137608))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200622 (= res!167964 (invariant!0 (currentBit!9348 thiss!1204) (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204))))))

(declare-fun b!200623 () Bool)

(declare-fun array_inv!4213 (array!10156) Bool)

(assert (=> b!200623 (= e!137609 (array_inv!4213 (buf!4973 thiss!1204)))))

(declare-fun b!200624 () Bool)

(declare-fun res!167962 () Bool)

(assert (=> b!200624 (=> (not res!167962) (not e!137608))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200624 (= res!167962 (validate_offset_bits!1 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))) ((_ sign_extend 32) (currentByte!9353 thiss!1204)) ((_ sign_extend 32) (currentBit!9348 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun lt!313621 () (_ BitVec 64))

(declare-fun b!200625 () Bool)

(declare-fun e!137606 () Bool)

(declare-fun lt!313619 () (_ BitVec 64))

(assert (=> b!200625 (= e!137606 (not (or (not (= lt!313621 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!313621 (bvand lt!313619 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!313618 () (_ BitVec 64))

(assert (=> b!200625 (= lt!313621 (bvand lt!313618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8052 BitStream!8052) Bool)

(assert (=> b!200625 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14246 0))(
  ( (Unit!14247) )
))
(declare-fun lt!313620 () Unit!14246)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8052) Unit!14246)

(assert (=> b!200625 (= lt!313620 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200626 () Bool)

(assert (=> b!200626 (= e!137608 e!137606)))

(declare-fun res!167963 () Bool)

(assert (=> b!200626 (=> (not res!167963) (not e!137606))))

(assert (=> b!200626 (= res!167963 (= lt!313618 (bvsub lt!313619 ((_ sign_extend 32) i!590))))))

(assert (=> b!200626 (= lt!313619 (bvadd lt!313618 ((_ sign_extend 32) nBits!348)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200626 (= lt!313618 (bitIndex!0 (size!4472 (buf!4973 thiss!1204)) (currentByte!9353 thiss!1204) (currentBit!9348 thiss!1204)))))

(declare-fun b!200627 () Bool)

(declare-fun res!167961 () Bool)

(assert (=> b!200627 (=> (not res!167961) (not e!137608))))

(assert (=> b!200627 (= res!167961 (= i!590 nBits!348))))

(assert (= (and start!42496 res!167960) b!200624))

(assert (= (and b!200624 res!167962) b!200622))

(assert (= (and b!200622 res!167964) b!200627))

(assert (= (and b!200627 res!167961) b!200626))

(assert (= (and b!200626 res!167963) b!200625))

(assert (= start!42496 b!200623))

(declare-fun m!311373 () Bool)

(assert (=> b!200623 m!311373))

(declare-fun m!311375 () Bool)

(assert (=> b!200622 m!311375))

(declare-fun m!311377 () Bool)

(assert (=> b!200625 m!311377))

(declare-fun m!311379 () Bool)

(assert (=> b!200625 m!311379))

(declare-fun m!311381 () Bool)

(assert (=> b!200624 m!311381))

(declare-fun m!311383 () Bool)

(assert (=> b!200626 m!311383))

(declare-fun m!311385 () Bool)

(assert (=> start!42496 m!311385))

(check-sat (not b!200626) (not b!200624) (not b!200625) (not b!200622) (not b!200623) (not start!42496))
(check-sat)
(get-model)

(declare-fun d!68825 () Bool)

(assert (=> d!68825 (= (invariant!0 (currentBit!9348 thiss!1204) (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204))) (and (bvsge (currentBit!9348 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9348 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9353 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204))) (and (= (currentBit!9348 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204)))))))))

(assert (=> b!200622 d!68825))

(declare-fun d!68829 () Bool)

(declare-fun res!167986 () Bool)

(declare-fun e!137626 () Bool)

(assert (=> d!68829 (=> (not res!167986) (not e!137626))))

(assert (=> d!68829 (= res!167986 (= (size!4472 (buf!4973 thiss!1204)) (size!4472 (buf!4973 thiss!1204))))))

(assert (=> d!68829 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137626)))

(declare-fun b!200652 () Bool)

(declare-fun res!167987 () Bool)

(assert (=> b!200652 (=> (not res!167987) (not e!137626))))

(assert (=> b!200652 (= res!167987 (bvsle (bitIndex!0 (size!4472 (buf!4973 thiss!1204)) (currentByte!9353 thiss!1204) (currentBit!9348 thiss!1204)) (bitIndex!0 (size!4472 (buf!4973 thiss!1204)) (currentByte!9353 thiss!1204) (currentBit!9348 thiss!1204))))))

(declare-fun b!200653 () Bool)

(declare-fun e!137627 () Bool)

(assert (=> b!200653 (= e!137626 e!137627)))

(declare-fun res!167988 () Bool)

(assert (=> b!200653 (=> res!167988 e!137627)))

(assert (=> b!200653 (= res!167988 (= (size!4472 (buf!4973 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200654 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10156 array!10156 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200654 (= e!137627 (arrayBitRangesEq!0 (buf!4973 thiss!1204) (buf!4973 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4472 (buf!4973 thiss!1204)) (currentByte!9353 thiss!1204) (currentBit!9348 thiss!1204))))))

(assert (= (and d!68829 res!167986) b!200652))

(assert (= (and b!200652 res!167987) b!200653))

(assert (= (and b!200653 (not res!167988)) b!200654))

(assert (=> b!200652 m!311383))

(assert (=> b!200652 m!311383))

(assert (=> b!200654 m!311383))

(assert (=> b!200654 m!311383))

(declare-fun m!311401 () Bool)

(assert (=> b!200654 m!311401))

(assert (=> b!200625 d!68829))

(declare-fun d!68833 () Bool)

(assert (=> d!68833 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313648 () Unit!14246)

(declare-fun choose!11 (BitStream!8052) Unit!14246)

(assert (=> d!68833 (= lt!313648 (choose!11 thiss!1204))))

(assert (=> d!68833 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313648)))

(declare-fun bs!16955 () Bool)

(assert (= bs!16955 d!68833))

(assert (=> bs!16955 m!311377))

(declare-fun m!311405 () Bool)

(assert (=> bs!16955 m!311405))

(assert (=> b!200625 d!68833))

(declare-fun d!68837 () Bool)

(declare-fun e!137638 () Bool)

(assert (=> d!68837 e!137638))

(declare-fun res!168005 () Bool)

(assert (=> d!68837 (=> (not res!168005) (not e!137638))))

(declare-fun lt!313688 () (_ BitVec 64))

(declare-fun lt!313687 () (_ BitVec 64))

(declare-fun lt!313685 () (_ BitVec 64))

(assert (=> d!68837 (= res!168005 (= lt!313685 (bvsub lt!313688 lt!313687)))))

(assert (=> d!68837 (or (= (bvand lt!313688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313688 lt!313687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68837 (= lt!313687 (remainingBits!0 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))) ((_ sign_extend 32) (currentByte!9353 thiss!1204)) ((_ sign_extend 32) (currentBit!9348 thiss!1204))))))

(declare-fun lt!313690 () (_ BitVec 64))

(declare-fun lt!313689 () (_ BitVec 64))

(assert (=> d!68837 (= lt!313688 (bvmul lt!313690 lt!313689))))

(assert (=> d!68837 (or (= lt!313690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313689 (bvsdiv (bvmul lt!313690 lt!313689) lt!313690)))))

(assert (=> d!68837 (= lt!313689 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68837 (= lt!313690 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))))))

(assert (=> d!68837 (= lt!313685 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9353 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9348 thiss!1204))))))

(assert (=> d!68837 (invariant!0 (currentBit!9348 thiss!1204) (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204)))))

(assert (=> d!68837 (= (bitIndex!0 (size!4472 (buf!4973 thiss!1204)) (currentByte!9353 thiss!1204) (currentBit!9348 thiss!1204)) lt!313685)))

(declare-fun b!200671 () Bool)

(declare-fun res!168008 () Bool)

(assert (=> b!200671 (=> (not res!168008) (not e!137638))))

(assert (=> b!200671 (= res!168008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313685))))

(declare-fun b!200672 () Bool)

(declare-fun lt!313686 () (_ BitVec 64))

(assert (=> b!200672 (= e!137638 (bvsle lt!313685 (bvmul lt!313686 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200672 (or (= lt!313686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313686)))))

(assert (=> b!200672 (= lt!313686 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))))))

(assert (= (and d!68837 res!168005) b!200671))

(assert (= (and b!200671 res!168008) b!200672))

(declare-fun m!311409 () Bool)

(assert (=> d!68837 m!311409))

(assert (=> d!68837 m!311375))

(assert (=> b!200626 d!68837))

(declare-fun d!68853 () Bool)

(assert (=> d!68853 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))) ((_ sign_extend 32) (currentByte!9353 thiss!1204)) ((_ sign_extend 32) (currentBit!9348 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4472 (buf!4973 thiss!1204))) ((_ sign_extend 32) (currentByte!9353 thiss!1204)) ((_ sign_extend 32) (currentBit!9348 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16958 () Bool)

(assert (= bs!16958 d!68853))

(assert (=> bs!16958 m!311409))

(assert (=> b!200624 d!68853))

(declare-fun d!68855 () Bool)

(assert (=> d!68855 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9348 thiss!1204) (currentByte!9353 thiss!1204) (size!4472 (buf!4973 thiss!1204))))))

(declare-fun bs!16959 () Bool)

(assert (= bs!16959 d!68855))

(assert (=> bs!16959 m!311375))

(assert (=> start!42496 d!68855))

(declare-fun d!68857 () Bool)

(assert (=> d!68857 (= (array_inv!4213 (buf!4973 thiss!1204)) (bvsge (size!4472 (buf!4973 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200623 d!68857))

(check-sat (not d!68853) (not b!200654) (not d!68837) (not d!68833) (not b!200652) (not d!68855))
