; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39024 () Bool)

(assert start!39024)

(declare-fun b!175713 () Bool)

(declare-fun e!122522 () Bool)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175713 (= e!122522 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175715 () Bool)

(declare-fun e!122525 () Bool)

(declare-fun e!122524 () Bool)

(assert (=> b!175715 (= e!122525 e!122524)))

(declare-fun res!145504 () Bool)

(assert (=> b!175715 (=> (not res!145504) (not e!122524))))

(declare-fun lt!270877 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175715 (= res!145504 (= lt!270877 (bvsub (bvadd lt!270877 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9483 0))(
  ( (array!9484 (arr!5115 (Array (_ BitVec 32) (_ BitVec 8))) (size!4185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7478 0))(
  ( (BitStream!7479 (buf!4625 array!9483) (currentByte!8754 (_ BitVec 32)) (currentBit!8749 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7478)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175715 (= lt!270877 (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)))))

(declare-fun b!175716 () Bool)

(assert (=> b!175716 (= e!122524 (not e!122522))))

(declare-fun res!145507 () Bool)

(assert (=> b!175716 (=> res!145507 e!122522)))

(declare-datatypes ((tuple2!15116 0))(
  ( (tuple2!15117 (_1!8203 BitStream!7478) (_2!8203 BitStream!7478)) )
))
(declare-fun lt!270875 () tuple2!15116)

(declare-fun lt!270874 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175716 (= res!145507 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4185 (buf!4625 (_1!8203 lt!270875)))) ((_ sign_extend 32) (currentByte!8754 (_1!8203 lt!270875))) ((_ sign_extend 32) (currentBit!8749 (_1!8203 lt!270875))) lt!270874)))))

(declare-datatypes ((Unit!12681 0))(
  ( (Unit!12682) )
))
(declare-fun lt!270878 () Unit!12681)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7478 array!9483 (_ BitVec 64)) Unit!12681)

(assert (=> b!175716 (= lt!270878 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4625 thiss!1204) lt!270874))))

(declare-fun reader!0 (BitStream!7478 BitStream!7478) tuple2!15116)

(assert (=> b!175716 (= lt!270875 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7478 BitStream!7478) Bool)

(assert (=> b!175716 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270876 () Unit!12681)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7478) Unit!12681)

(assert (=> b!175716 (= lt!270876 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175717 () Bool)

(declare-fun res!145508 () Bool)

(assert (=> b!175717 (=> (not res!145508) (not e!122525))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175717 (= res!145508 (invariant!0 (currentBit!8749 thiss!1204) (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204))))))

(declare-fun b!175718 () Bool)

(declare-fun e!122523 () Bool)

(declare-fun array_inv!3926 (array!9483) Bool)

(assert (=> b!175718 (= e!122523 (array_inv!3926 (buf!4625 thiss!1204)))))

(declare-fun b!175719 () Bool)

(declare-fun res!145509 () Bool)

(assert (=> b!175719 (=> (not res!145509) (not e!122525))))

(assert (=> b!175719 (= res!145509 (= i!590 nBits!348))))

(declare-fun res!145505 () Bool)

(declare-fun e!122526 () Bool)

(assert (=> start!39024 (=> (not res!145505) (not e!122526))))

(assert (=> start!39024 (= res!145505 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39024 e!122526))

(assert (=> start!39024 true))

(declare-fun inv!12 (BitStream!7478) Bool)

(assert (=> start!39024 (and (inv!12 thiss!1204) e!122523)))

(declare-fun b!175714 () Bool)

(assert (=> b!175714 (= e!122526 e!122525)))

(declare-fun res!145506 () Bool)

(assert (=> b!175714 (=> (not res!145506) (not e!122525))))

(assert (=> b!175714 (= res!145506 (validate_offset_bits!1 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))) ((_ sign_extend 32) (currentByte!8754 thiss!1204)) ((_ sign_extend 32) (currentBit!8749 thiss!1204)) lt!270874))))

(assert (=> b!175714 (= lt!270874 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39024 res!145505) b!175714))

(assert (= (and b!175714 res!145506) b!175717))

(assert (= (and b!175717 res!145508) b!175719))

(assert (= (and b!175719 res!145509) b!175715))

(assert (= (and b!175715 res!145504) b!175716))

(assert (= (and b!175716 (not res!145507)) b!175713))

(assert (= start!39024 b!175718))

(declare-fun m!275899 () Bool)

(assert (=> b!175717 m!275899))

(declare-fun m!275901 () Bool)

(assert (=> b!175713 m!275901))

(declare-fun m!275903 () Bool)

(assert (=> b!175713 m!275903))

(declare-fun m!275905 () Bool)

(assert (=> b!175716 m!275905))

(declare-fun m!275907 () Bool)

(assert (=> b!175716 m!275907))

(declare-fun m!275909 () Bool)

(assert (=> b!175716 m!275909))

(declare-fun m!275911 () Bool)

(assert (=> b!175716 m!275911))

(declare-fun m!275913 () Bool)

(assert (=> b!175716 m!275913))

(declare-fun m!275915 () Bool)

(assert (=> start!39024 m!275915))

(declare-fun m!275917 () Bool)

(assert (=> b!175718 m!275917))

(declare-fun m!275919 () Bool)

(assert (=> b!175714 m!275919))

(declare-fun m!275921 () Bool)

(assert (=> b!175715 m!275921))

(push 1)

(assert (not b!175716))

(assert (not b!175715))

(assert (not b!175718))

(assert (not b!175717))

(assert (not b!175714))

(assert (not b!175713))

(assert (not start!39024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61997 () Bool)

(declare-fun e!122535 () Bool)

(assert (=> d!61997 e!122535))

(declare-fun res!145522 () Bool)

(assert (=> d!61997 (=> (not res!145522) (not e!122535))))

(declare-fun lt!270924 () (_ BitVec 64))

(declare-fun lt!270918 () (_ BitVec 64))

(declare-fun lt!270922 () (_ BitVec 64))

(assert (=> d!61997 (= res!145522 (= lt!270924 (bvsub lt!270918 lt!270922)))))

(assert (=> d!61997 (or (= (bvand lt!270918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270922 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270918 lt!270922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61997 (= lt!270922 (remainingBits!0 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))) ((_ sign_extend 32) (currentByte!8754 thiss!1204)) ((_ sign_extend 32) (currentBit!8749 thiss!1204))))))

(declare-fun lt!270923 () (_ BitVec 64))

(declare-fun lt!270919 () (_ BitVec 64))

(assert (=> d!61997 (= lt!270918 (bvmul lt!270923 lt!270919))))

(assert (=> d!61997 (or (= lt!270923 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270919 (bvsdiv (bvmul lt!270923 lt!270919) lt!270923)))))

(assert (=> d!61997 (= lt!270919 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61997 (= lt!270923 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))))))

(assert (=> d!61997 (= lt!270924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8754 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8749 thiss!1204))))))

(assert (=> d!61997 (invariant!0 (currentBit!8749 thiss!1204) (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204)))))

(assert (=> d!61997 (= (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)) lt!270924)))

(declare-fun b!175730 () Bool)

(declare-fun res!145523 () Bool)

(assert (=> b!175730 (=> (not res!145523) (not e!122535))))

(assert (=> b!175730 (= res!145523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270924))))

(declare-fun b!175731 () Bool)

(declare-fun lt!270917 () (_ BitVec 64))

(assert (=> b!175731 (= e!122535 (bvsle lt!270924 (bvmul lt!270917 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175731 (or (= lt!270917 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270917 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270917)))))

(assert (=> b!175731 (= lt!270917 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))))))

(assert (= (and d!61997 res!145522) b!175730))

(assert (= (and b!175730 res!145523) b!175731))

(declare-fun m!275927 () Bool)

(assert (=> d!61997 m!275927))

(assert (=> d!61997 m!275899))

(assert (=> b!175715 d!61997))

(declare-fun d!62005 () Bool)

(assert (=> d!62005 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))) ((_ sign_extend 32) (currentByte!8754 thiss!1204)) ((_ sign_extend 32) (currentBit!8749 thiss!1204)) lt!270874) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))) ((_ sign_extend 32) (currentByte!8754 thiss!1204)) ((_ sign_extend 32) (currentBit!8749 thiss!1204))) lt!270874))))

(declare-fun bs!15472 () Bool)

(assert (= bs!15472 d!62005))

(assert (=> bs!15472 m!275927))

(assert (=> b!175714 d!62005))

(declare-fun d!62009 () Bool)

(assert (=> d!62009 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!175713 d!62009))

(declare-fun d!62011 () Bool)

(assert (=> d!62011 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!175713 d!62011))

(declare-fun d!62015 () Bool)

(assert (=> d!62015 (= (array_inv!3926 (buf!4625 thiss!1204)) (bvsge (size!4185 (buf!4625 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175718 d!62015))

(declare-fun d!62021 () Bool)

(assert (=> d!62021 (= (invariant!0 (currentBit!8749 thiss!1204) (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204))) (and (bvsge (currentBit!8749 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8749 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8754 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204))) (and (= (currentBit!8749 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204)))))))))

(assert (=> b!175717 d!62021))

(declare-fun d!62027 () Bool)

(assert (=> d!62027 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8749 thiss!1204) (currentByte!8754 thiss!1204) (size!4185 (buf!4625 thiss!1204))))))

(declare-fun bs!15476 () Bool)

(assert (= bs!15476 d!62027))

(assert (=> bs!15476 m!275899))

(assert (=> start!39024 d!62027))

(declare-fun d!62031 () Bool)

(assert (=> d!62031 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270941 () Unit!12681)

(declare-fun choose!11 (BitStream!7478) Unit!12681)

(assert (=> d!62031 (= lt!270941 (choose!11 thiss!1204))))

(assert (=> d!62031 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270941)))

(declare-fun bs!15480 () Bool)

(assert (= bs!15480 d!62031))

(assert (=> bs!15480 m!275909))

(declare-fun m!275937 () Bool)

(assert (=> bs!15480 m!275937))

(assert (=> b!175716 d!62031))

(declare-fun d!62039 () Bool)

(assert (=> d!62039 (validate_offset_bits!1 ((_ sign_extend 32) (size!4185 (buf!4625 thiss!1204))) ((_ sign_extend 32) (currentByte!8754 thiss!1204)) ((_ sign_extend 32) (currentBit!8749 thiss!1204)) lt!270874)))

(declare-fun lt!270947 () Unit!12681)

(declare-fun choose!9 (BitStream!7478 array!9483 (_ BitVec 64) BitStream!7478) Unit!12681)

(assert (=> d!62039 (= lt!270947 (choose!9 thiss!1204 (buf!4625 thiss!1204) lt!270874 (BitStream!7479 (buf!4625 thiss!1204) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204))))))

(assert (=> d!62039 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4625 thiss!1204) lt!270874) lt!270947)))

(declare-fun bs!15483 () Bool)

(assert (= bs!15483 d!62039))

(assert (=> bs!15483 m!275919))

(declare-fun m!275941 () Bool)

(assert (=> bs!15483 m!275941))

(assert (=> b!175716 d!62039))

(declare-fun lt!271120 () (_ BitVec 64))

(declare-fun b!175787 () Bool)

(declare-fun e!122560 () Bool)

(declare-fun lt!271123 () tuple2!15116)

(declare-fun lt!271109 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7478 (_ BitVec 64)) BitStream!7478)

(assert (=> b!175787 (= e!122560 (= (_1!8203 lt!271123) (withMovedBitIndex!0 (_2!8203 lt!271123) (bvsub lt!271109 lt!271120))))))

(assert (=> b!175787 (or (= (bvand lt!271109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271109 lt!271120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175787 (= lt!271120 (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)))))

(assert (=> b!175787 (= lt!271109 (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)))))

(declare-fun b!175788 () Bool)

(declare-fun res!145561 () Bool)

(assert (=> b!175788 (=> (not res!145561) (not e!122560))))

(assert (=> b!175788 (= res!145561 (isPrefixOf!0 (_1!8203 lt!271123) thiss!1204))))

(declare-fun d!62043 () Bool)

(assert (=> d!62043 e!122560))

(declare-fun res!145563 () Bool)

(assert (=> d!62043 (=> (not res!145563) (not e!122560))))

(assert (=> d!62043 (= res!145563 (isPrefixOf!0 (_1!8203 lt!271123) (_2!8203 lt!271123)))))

(declare-fun lt!271112 () BitStream!7478)

(assert (=> d!62043 (= lt!271123 (tuple2!15117 lt!271112 thiss!1204))))

(declare-fun lt!271122 () Unit!12681)

(declare-fun lt!271111 () Unit!12681)

(assert (=> d!62043 (= lt!271122 lt!271111)))

(assert (=> d!62043 (isPrefixOf!0 lt!271112 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7478 BitStream!7478 BitStream!7478) Unit!12681)

(assert (=> d!62043 (= lt!271111 (lemmaIsPrefixTransitive!0 lt!271112 thiss!1204 thiss!1204))))

(declare-fun lt!271115 () Unit!12681)

(declare-fun lt!271124 () Unit!12681)

(assert (=> d!62043 (= lt!271115 lt!271124)))

(assert (=> d!62043 (isPrefixOf!0 lt!271112 thiss!1204)))

(assert (=> d!62043 (= lt!271124 (lemmaIsPrefixTransitive!0 lt!271112 thiss!1204 thiss!1204))))

(declare-fun lt!271127 () Unit!12681)

(declare-fun e!122559 () Unit!12681)

(assert (=> d!62043 (= lt!271127 e!122559)))

(declare-fun c!9240 () Bool)

(assert (=> d!62043 (= c!9240 (not (= (size!4185 (buf!4625 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!271108 () Unit!12681)

(declare-fun lt!271113 () Unit!12681)

(assert (=> d!62043 (= lt!271108 lt!271113)))

(assert (=> d!62043 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62043 (= lt!271113 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!271114 () Unit!12681)

(declare-fun lt!271110 () Unit!12681)

(assert (=> d!62043 (= lt!271114 lt!271110)))

(assert (=> d!62043 (= lt!271110 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!271125 () Unit!12681)

(declare-fun lt!271121 () Unit!12681)

(assert (=> d!62043 (= lt!271125 lt!271121)))

(assert (=> d!62043 (isPrefixOf!0 lt!271112 lt!271112)))

(assert (=> d!62043 (= lt!271121 (lemmaIsPrefixRefl!0 lt!271112))))

(declare-fun lt!271117 () Unit!12681)

(declare-fun lt!271126 () Unit!12681)

(assert (=> d!62043 (= lt!271117 lt!271126)))

(assert (=> d!62043 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62043 (= lt!271126 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62043 (= lt!271112 (BitStream!7479 (buf!4625 thiss!1204) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)))))

(assert (=> d!62043 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62043 (= (reader!0 thiss!1204 thiss!1204) lt!271123)))

(declare-fun b!175789 () Bool)

(declare-fun Unit!12685 () Unit!12681)

(assert (=> b!175789 (= e!122559 Unit!12685)))

(declare-fun b!175790 () Bool)

(declare-fun res!145562 () Bool)

(assert (=> b!175790 (=> (not res!145562) (not e!122560))))

(assert (=> b!175790 (= res!145562 (isPrefixOf!0 (_2!8203 lt!271123) thiss!1204))))

(declare-fun b!175791 () Bool)

(declare-fun lt!271116 () Unit!12681)

(assert (=> b!175791 (= e!122559 lt!271116)))

(declare-fun lt!271119 () (_ BitVec 64))

(assert (=> b!175791 (= lt!271119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!271118 () (_ BitVec 64))

(assert (=> b!175791 (= lt!271118 (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9483 array!9483 (_ BitVec 64) (_ BitVec 64)) Unit!12681)

(assert (=> b!175791 (= lt!271116 (arrayBitRangesEqSymmetric!0 (buf!4625 thiss!1204) (buf!4625 thiss!1204) lt!271119 lt!271118))))

(declare-fun arrayBitRangesEq!0 (array!9483 array!9483 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175791 (arrayBitRangesEq!0 (buf!4625 thiss!1204) (buf!4625 thiss!1204) lt!271119 lt!271118)))

(assert (= (and d!62043 c!9240) b!175791))

(assert (= (and d!62043 (not c!9240)) b!175789))

(assert (= (and d!62043 res!145563) b!175788))

(assert (= (and b!175788 res!145561) b!175790))

(assert (= (and b!175790 res!145562) b!175787))

(assert (=> d!62043 m!275905))

(declare-fun m!275979 () Bool)

(assert (=> d!62043 m!275979))

(declare-fun m!275983 () Bool)

(assert (=> d!62043 m!275983))

(assert (=> d!62043 m!275909))

(declare-fun m!275987 () Bool)

(assert (=> d!62043 m!275987))

(assert (=> d!62043 m!275905))

(declare-fun m!275989 () Bool)

(assert (=> d!62043 m!275989))

(assert (=> d!62043 m!275909))

(declare-fun m!275993 () Bool)

(assert (=> d!62043 m!275993))

(assert (=> d!62043 m!275987))

(assert (=> d!62043 m!275909))

(declare-fun m!275995 () Bool)

(assert (=> b!175787 m!275995))

(assert (=> b!175787 m!275921))

(assert (=> b!175787 m!275921))

(declare-fun m!275997 () Bool)

(assert (=> b!175788 m!275997))

(assert (=> b!175791 m!275921))

(declare-fun m!275999 () Bool)

(assert (=> b!175791 m!275999))

(declare-fun m!276001 () Bool)

(assert (=> b!175791 m!276001))

(declare-fun m!276003 () Bool)

(assert (=> b!175790 m!276003))

(assert (=> b!175716 d!62043))

(declare-fun d!62051 () Bool)

(declare-fun res!145576 () Bool)

(declare-fun e!122569 () Bool)

(assert (=> d!62051 (=> (not res!145576) (not e!122569))))

(assert (=> d!62051 (= res!145576 (= (size!4185 (buf!4625 thiss!1204)) (size!4185 (buf!4625 thiss!1204))))))

(assert (=> d!62051 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122569)))

(declare-fun b!175804 () Bool)

(declare-fun res!145578 () Bool)

(assert (=> b!175804 (=> (not res!145578) (not e!122569))))

(assert (=> b!175804 (= res!145578 (bvsle (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204)) (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204))))))

(declare-fun b!175805 () Bool)

(declare-fun e!122570 () Bool)

(assert (=> b!175805 (= e!122569 e!122570)))

(declare-fun res!145577 () Bool)

(assert (=> b!175805 (=> res!145577 e!122570)))

(assert (=> b!175805 (= res!145577 (= (size!4185 (buf!4625 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175806 () Bool)

(assert (=> b!175806 (= e!122570 (arrayBitRangesEq!0 (buf!4625 thiss!1204) (buf!4625 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4185 (buf!4625 thiss!1204)) (currentByte!8754 thiss!1204) (currentBit!8749 thiss!1204))))))

(assert (= (and d!62051 res!145576) b!175804))

(assert (= (and b!175804 res!145578) b!175805))

(assert (= (and b!175805 (not res!145577)) b!175806))

(assert (=> b!175804 m!275921))

(assert (=> b!175804 m!275921))

(assert (=> b!175806 m!275921))

(assert (=> b!175806 m!275921))

(declare-fun m!276005 () Bool)

(assert (=> b!175806 m!276005))

(assert (=> b!175716 d!62051))

(declare-fun d!62053 () Bool)

(assert (=> d!62053 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4185 (buf!4625 (_1!8203 lt!270875)))) ((_ sign_extend 32) (currentByte!8754 (_1!8203 lt!270875))) ((_ sign_extend 32) (currentBit!8749 (_1!8203 lt!270875))) lt!270874) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4185 (buf!4625 (_1!8203 lt!270875)))) ((_ sign_extend 32) (currentByte!8754 (_1!8203 lt!270875))) ((_ sign_extend 32) (currentBit!8749 (_1!8203 lt!270875)))) lt!270874))))

(declare-fun bs!15485 () Bool)

(assert (= bs!15485 d!62053))

(declare-fun m!276007 () Bool)

(assert (=> bs!15485 m!276007))

(assert (=> b!175716 d!62053))

(push 1)

(assert (not b!175788))

(assert (not b!175787))

(assert (not d!62039))

(assert (not d!62043))

(assert (not d!62027))

(assert (not b!175804))

(assert (not d!62031))

(assert (not b!175791))

(assert (not d!62053))

(assert (not b!175790))

(assert (not b!175806))

(assert (not d!62005))

(assert (not d!61997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

