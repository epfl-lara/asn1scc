; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42542 () Bool)

(assert start!42542)

(declare-fun b!200703 () Bool)

(declare-fun e!137659 () Bool)

(declare-datatypes ((array!10163 0))(
  ( (array!10164 (arr!5404 (Array (_ BitVec 32) (_ BitVec 8))) (size!4474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8056 0))(
  ( (BitStream!8057 (buf!4975 array!10163) (currentByte!9364 (_ BitVec 32)) (currentBit!9359 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8056)

(declare-fun array_inv!4215 (array!10163) Bool)

(assert (=> b!200703 (= e!137659 (array_inv!4215 (buf!4975 thiss!1204)))))

(declare-fun b!200704 () Bool)

(declare-fun e!137657 () Bool)

(declare-fun e!137660 () Bool)

(assert (=> b!200704 (= e!137657 e!137660)))

(declare-fun res!168039 () Bool)

(assert (=> b!200704 (=> (not res!168039) (not e!137660))))

(declare-fun lt!313711 () (_ BitVec 64))

(declare-fun lt!313710 () (_ BitVec 64))

(assert (=> b!200704 (= res!168039 (= lt!313711 lt!313710))))

(declare-fun lt!313707 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!200704 (= lt!313710 (bvsub lt!313707 ((_ sign_extend 32) i!590)))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200704 (= lt!313707 (bvadd lt!313711 ((_ sign_extend 32) nBits!348)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200704 (= lt!313711 (bitIndex!0 (size!4474 (buf!4975 thiss!1204)) (currentByte!9364 thiss!1204) (currentBit!9359 thiss!1204)))))

(declare-fun b!200705 () Bool)

(declare-fun res!168036 () Bool)

(assert (=> b!200705 (=> (not res!168036) (not e!137657))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200705 (= res!168036 (validate_offset_bits!1 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))) ((_ sign_extend 32) (currentByte!9364 thiss!1204)) ((_ sign_extend 32) (currentBit!9359 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200706 () Bool)

(declare-fun res!168037 () Bool)

(assert (=> b!200706 (=> (not res!168037) (not e!137657))))

(assert (=> b!200706 (= res!168037 (= i!590 nBits!348))))

(declare-fun res!168038 () Bool)

(assert (=> start!42542 (=> (not res!168038) (not e!137657))))

(assert (=> start!42542 (= res!168038 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42542 e!137657))

(assert (=> start!42542 true))

(declare-fun inv!12 (BitStream!8056) Bool)

(assert (=> start!42542 (and (inv!12 thiss!1204) e!137659)))

(declare-fun lt!313709 () (_ BitVec 64))

(declare-fun b!200707 () Bool)

(assert (=> b!200707 (= e!137660 (not (or (= lt!313709 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!313709 (bvand lt!313710 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200707 (= lt!313709 (bvand lt!313707 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8056 BitStream!8056) Bool)

(assert (=> b!200707 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14250 0))(
  ( (Unit!14251) )
))
(declare-fun lt!313708 () Unit!14250)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8056) Unit!14250)

(assert (=> b!200707 (= lt!313708 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200708 () Bool)

(declare-fun res!168035 () Bool)

(assert (=> b!200708 (=> (not res!168035) (not e!137657))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200708 (= res!168035 (invariant!0 (currentBit!9359 thiss!1204) (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204))))))

(assert (= (and start!42542 res!168038) b!200705))

(assert (= (and b!200705 res!168036) b!200708))

(assert (= (and b!200708 res!168035) b!200706))

(assert (= (and b!200706 res!168037) b!200704))

(assert (= (and b!200704 res!168039) b!200707))

(assert (= start!42542 b!200703))

(declare-fun m!311419 () Bool)

(assert (=> b!200704 m!311419))

(declare-fun m!311421 () Bool)

(assert (=> b!200708 m!311421))

(declare-fun m!311423 () Bool)

(assert (=> b!200703 m!311423))

(declare-fun m!311425 () Bool)

(assert (=> b!200705 m!311425))

(declare-fun m!311427 () Bool)

(assert (=> start!42542 m!311427))

(declare-fun m!311429 () Bool)

(assert (=> b!200707 m!311429))

(declare-fun m!311431 () Bool)

(assert (=> b!200707 m!311431))

(push 1)

(assert (not b!200704))

(assert (not b!200707))

(assert (not b!200703))

(assert (not start!42542))

(assert (not b!200708))

(assert (not b!200705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!68869 () Bool)

(assert (=> d!68869 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9359 thiss!1204) (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204))))))

(declare-fun bs!16968 () Bool)

(assert (= bs!16968 d!68869))

(assert (=> bs!16968 m!311421))

(assert (=> start!42542 d!68869))

(declare-fun d!68871 () Bool)

(declare-fun res!168078 () Bool)

(declare-fun e!137689 () Bool)

(assert (=> d!68871 (=> (not res!168078) (not e!137689))))

(assert (=> d!68871 (= res!168078 (= (size!4474 (buf!4975 thiss!1204)) (size!4474 (buf!4975 thiss!1204))))))

(assert (=> d!68871 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137689)))

(declare-fun b!200751 () Bool)

(declare-fun res!168076 () Bool)

(assert (=> b!200751 (=> (not res!168076) (not e!137689))))

(assert (=> b!200751 (= res!168076 (bvsle (bitIndex!0 (size!4474 (buf!4975 thiss!1204)) (currentByte!9364 thiss!1204) (currentBit!9359 thiss!1204)) (bitIndex!0 (size!4474 (buf!4975 thiss!1204)) (currentByte!9364 thiss!1204) (currentBit!9359 thiss!1204))))))

(declare-fun b!200752 () Bool)

(declare-fun e!137690 () Bool)

(assert (=> b!200752 (= e!137689 e!137690)))

(declare-fun res!168077 () Bool)

(assert (=> b!200752 (=> res!168077 e!137690)))

(assert (=> b!200752 (= res!168077 (= (size!4474 (buf!4975 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200753 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10163 array!10163 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200753 (= e!137690 (arrayBitRangesEq!0 (buf!4975 thiss!1204) (buf!4975 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4474 (buf!4975 thiss!1204)) (currentByte!9364 thiss!1204) (currentBit!9359 thiss!1204))))))

(assert (= (and d!68871 res!168078) b!200751))

(assert (= (and b!200751 res!168076) b!200752))

(assert (= (and b!200752 (not res!168077)) b!200753))

(assert (=> b!200751 m!311419))

(assert (=> b!200751 m!311419))

(assert (=> b!200753 m!311419))

(assert (=> b!200753 m!311419))

(declare-fun m!311461 () Bool)

(assert (=> b!200753 m!311461))

(assert (=> b!200707 d!68871))

(declare-fun d!68875 () Bool)

(assert (=> d!68875 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313744 () Unit!14250)

(declare-fun choose!11 (BitStream!8056) Unit!14250)

(assert (=> d!68875 (= lt!313744 (choose!11 thiss!1204))))

(assert (=> d!68875 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313744)))

(declare-fun bs!16970 () Bool)

(assert (= bs!16970 d!68875))

(assert (=> bs!16970 m!311429))

(declare-fun m!311463 () Bool)

(assert (=> bs!16970 m!311463))

(assert (=> b!200707 d!68875))

(declare-fun d!68881 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68881 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))) ((_ sign_extend 32) (currentByte!9364 thiss!1204)) ((_ sign_extend 32) (currentBit!9359 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))) ((_ sign_extend 32) (currentByte!9364 thiss!1204)) ((_ sign_extend 32) (currentBit!9359 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16973 () Bool)

(assert (= bs!16973 d!68881))

(declare-fun m!311467 () Bool)

(assert (=> bs!16973 m!311467))

(assert (=> b!200705 d!68881))

(declare-fun d!68887 () Bool)

(declare-fun e!137696 () Bool)

(assert (=> d!68887 e!137696))

(declare-fun res!168089 () Bool)

(assert (=> d!68887 (=> (not res!168089) (not e!137696))))

(declare-fun lt!313776 () (_ BitVec 64))

(declare-fun lt!313779 () (_ BitVec 64))

(declare-fun lt!313777 () (_ BitVec 64))

(assert (=> d!68887 (= res!168089 (= lt!313777 (bvsub lt!313776 lt!313779)))))

(assert (=> d!68887 (or (= (bvand lt!313776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313776 lt!313779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!68887 (= lt!313779 (remainingBits!0 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))) ((_ sign_extend 32) (currentByte!9364 thiss!1204)) ((_ sign_extend 32) (currentBit!9359 thiss!1204))))))

(declare-fun lt!313780 () (_ BitVec 64))

(declare-fun lt!313778 () (_ BitVec 64))

(assert (=> d!68887 (= lt!313776 (bvmul lt!313780 lt!313778))))

(assert (=> d!68887 (or (= lt!313780 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313778 (bvsdiv (bvmul lt!313780 lt!313778) lt!313780)))))

(assert (=> d!68887 (= lt!313778 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68887 (= lt!313780 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))))))

(assert (=> d!68887 (= lt!313777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9364 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9359 thiss!1204))))))

(assert (=> d!68887 (invariant!0 (currentBit!9359 thiss!1204) (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204)))))

(assert (=> d!68887 (= (bitIndex!0 (size!4474 (buf!4975 thiss!1204)) (currentByte!9364 thiss!1204) (currentBit!9359 thiss!1204)) lt!313777)))

(declare-fun b!200764 () Bool)

(declare-fun res!168090 () Bool)

(assert (=> b!200764 (=> (not res!168090) (not e!137696))))

(assert (=> b!200764 (= res!168090 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313777))))

(declare-fun b!200765 () Bool)

(declare-fun lt!313775 () (_ BitVec 64))

(assert (=> b!200765 (= e!137696 (bvsle lt!313777 (bvmul lt!313775 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200765 (or (= lt!313775 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313775 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313775)))))

(assert (=> b!200765 (= lt!313775 ((_ sign_extend 32) (size!4474 (buf!4975 thiss!1204))))))

(assert (= (and d!68887 res!168089) b!200764))

(assert (= (and b!200764 res!168090) b!200765))

(assert (=> d!68887 m!311467))

(assert (=> d!68887 m!311421))

(assert (=> b!200704 d!68887))

(declare-fun d!68899 () Bool)

(assert (=> d!68899 (= (invariant!0 (currentBit!9359 thiss!1204) (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204))) (and (bvsge (currentBit!9359 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9359 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9364 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204))) (and (= (currentBit!9359 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9364 thiss!1204) (size!4474 (buf!4975 thiss!1204)))))))))

(assert (=> b!200708 d!68899))

(declare-fun d!68901 () Bool)

(assert (=> d!68901 (= (array_inv!4215 (buf!4975 thiss!1204)) (bvsge (size!4474 (buf!4975 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200703 d!68901))

(push 1)

(assert (not d!68881))

(assert (not b!200753))

(assert (not d!68869))

(assert (not d!68875))

(assert (not d!68887))

(assert (not b!200751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

