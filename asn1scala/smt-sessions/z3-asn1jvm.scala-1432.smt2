; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39358 () Bool)

(assert start!39358)

(declare-fun b!176914 () Bool)

(declare-fun e!123295 () Bool)

(declare-fun e!123296 () Bool)

(assert (=> b!176914 (= e!123295 e!123296)))

(declare-fun res!146616 () Bool)

(assert (=> b!176914 (=> (not res!146616) (not e!123296))))

(declare-datatypes ((array!9550 0))(
  ( (array!9551 (arr!5141 (Array (_ BitVec 32) (_ BitVec 8))) (size!4211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7530 0))(
  ( (BitStream!7531 (buf!4654 array!9550) (currentByte!8825 (_ BitVec 32)) (currentBit!8820 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12736 0))(
  ( (Unit!12737) )
))
(declare-datatypes ((tuple2!15234 0))(
  ( (tuple2!15235 (_1!8262 Unit!12736) (_2!8262 BitStream!7530)) )
))
(declare-fun lt!272107 () tuple2!15234)

(declare-fun lt!272102 () Bool)

(declare-datatypes ((tuple2!15236 0))(
  ( (tuple2!15237 (_1!8263 BitStream!7530) (_2!8263 Bool)) )
))
(declare-fun lt!272106 () tuple2!15236)

(assert (=> b!176914 (= res!146616 (and (= (_2!8263 lt!272106) lt!272102) (= (_1!8263 lt!272106) (_2!8262 lt!272107))))))

(declare-fun thiss!1204 () BitStream!7530)

(declare-fun readBitPure!0 (BitStream!7530) tuple2!15236)

(declare-fun readerFrom!0 (BitStream!7530 (_ BitVec 32) (_ BitVec 32)) BitStream!7530)

(assert (=> b!176914 (= lt!272106 (readBitPure!0 (readerFrom!0 (_2!8262 lt!272107) (currentBit!8820 thiss!1204) (currentByte!8825 thiss!1204))))))

(declare-fun b!176915 () Bool)

(declare-fun res!146615 () Bool)

(declare-fun e!123297 () Bool)

(assert (=> b!176915 (=> (not res!146615) (not e!123297))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176915 (= res!146615 (not (= i!590 nBits!348)))))

(declare-fun b!176916 () Bool)

(declare-fun res!146609 () Bool)

(assert (=> b!176916 (=> (not res!146609) (not e!123297))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176916 (= res!146609 (invariant!0 (currentBit!8820 thiss!1204) (currentByte!8825 thiss!1204) (size!4211 (buf!4654 thiss!1204))))))

(declare-fun b!176917 () Bool)

(declare-fun lt!272108 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176917 (= e!123296 (= (bitIndex!0 (size!4211 (buf!4654 (_1!8263 lt!272106))) (currentByte!8825 (_1!8263 lt!272106)) (currentBit!8820 (_1!8263 lt!272106))) lt!272108))))

(declare-fun b!176918 () Bool)

(assert (=> b!176918 (= e!123297 (not true))))

(declare-fun lt!272104 () (_ BitVec 64))

(assert (=> b!176918 (= lt!272104 (bitIndex!0 (size!4211 (buf!4654 (_2!8262 lt!272107))) (currentByte!8825 (_2!8262 lt!272107)) (currentBit!8820 (_2!8262 lt!272107))))))

(declare-fun lt!272105 () (_ BitVec 64))

(assert (=> b!176918 (= lt!272105 (bitIndex!0 (size!4211 (buf!4654 thiss!1204)) (currentByte!8825 thiss!1204) (currentBit!8820 thiss!1204)))))

(declare-fun e!123293 () Bool)

(assert (=> b!176918 e!123293))

(declare-fun res!146610 () Bool)

(assert (=> b!176918 (=> (not res!146610) (not e!123293))))

(assert (=> b!176918 (= res!146610 (= (size!4211 (buf!4654 thiss!1204)) (size!4211 (buf!4654 (_2!8262 lt!272107)))))))

(declare-fun appendBit!0 (BitStream!7530 Bool) tuple2!15234)

(assert (=> b!176918 (= lt!272107 (appendBit!0 thiss!1204 lt!272102))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176918 (= lt!272102 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!146611 () Bool)

(assert (=> start!39358 (=> (not res!146611) (not e!123297))))

(assert (=> start!39358 (= res!146611 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39358 e!123297))

(assert (=> start!39358 true))

(declare-fun e!123294 () Bool)

(declare-fun inv!12 (BitStream!7530) Bool)

(assert (=> start!39358 (and (inv!12 thiss!1204) e!123294)))

(declare-fun b!176919 () Bool)

(assert (=> b!176919 (= e!123293 e!123295)))

(declare-fun res!146612 () Bool)

(assert (=> b!176919 (=> (not res!146612) (not e!123295))))

(declare-fun lt!272103 () (_ BitVec 64))

(assert (=> b!176919 (= res!146612 (= lt!272108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272103)))))

(assert (=> b!176919 (= lt!272108 (bitIndex!0 (size!4211 (buf!4654 (_2!8262 lt!272107))) (currentByte!8825 (_2!8262 lt!272107)) (currentBit!8820 (_2!8262 lt!272107))))))

(assert (=> b!176919 (= lt!272103 (bitIndex!0 (size!4211 (buf!4654 thiss!1204)) (currentByte!8825 thiss!1204) (currentBit!8820 thiss!1204)))))

(declare-fun b!176920 () Bool)

(declare-fun res!146613 () Bool)

(assert (=> b!176920 (=> (not res!146613) (not e!123297))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176920 (= res!146613 (validate_offset_bits!1 ((_ sign_extend 32) (size!4211 (buf!4654 thiss!1204))) ((_ sign_extend 32) (currentByte!8825 thiss!1204)) ((_ sign_extend 32) (currentBit!8820 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176921 () Bool)

(declare-fun res!146614 () Bool)

(assert (=> b!176921 (=> (not res!146614) (not e!123295))))

(declare-fun isPrefixOf!0 (BitStream!7530 BitStream!7530) Bool)

(assert (=> b!176921 (= res!146614 (isPrefixOf!0 thiss!1204 (_2!8262 lt!272107)))))

(declare-fun b!176922 () Bool)

(declare-fun array_inv!3952 (array!9550) Bool)

(assert (=> b!176922 (= e!123294 (array_inv!3952 (buf!4654 thiss!1204)))))

(assert (= (and start!39358 res!146611) b!176920))

(assert (= (and b!176920 res!146613) b!176916))

(assert (= (and b!176916 res!146609) b!176915))

(assert (= (and b!176915 res!146615) b!176918))

(assert (= (and b!176918 res!146610) b!176919))

(assert (= (and b!176919 res!146612) b!176921))

(assert (= (and b!176921 res!146614) b!176914))

(assert (= (and b!176914 res!146616) b!176917))

(assert (= start!39358 b!176922))

(declare-fun m!276929 () Bool)

(assert (=> b!176921 m!276929))

(declare-fun m!276931 () Bool)

(assert (=> b!176919 m!276931))

(declare-fun m!276933 () Bool)

(assert (=> b!176919 m!276933))

(declare-fun m!276935 () Bool)

(assert (=> b!176916 m!276935))

(declare-fun m!276937 () Bool)

(assert (=> b!176914 m!276937))

(assert (=> b!176914 m!276937))

(declare-fun m!276939 () Bool)

(assert (=> b!176914 m!276939))

(declare-fun m!276941 () Bool)

(assert (=> b!176917 m!276941))

(assert (=> b!176918 m!276931))

(assert (=> b!176918 m!276933))

(declare-fun m!276943 () Bool)

(assert (=> b!176918 m!276943))

(declare-fun m!276945 () Bool)

(assert (=> start!39358 m!276945))

(declare-fun m!276947 () Bool)

(assert (=> b!176920 m!276947))

(declare-fun m!276949 () Bool)

(assert (=> b!176922 m!276949))

(check-sat (not b!176918) (not b!176916) (not b!176921) (not b!176920) (not b!176917) (not b!176914) (not b!176919) (not b!176922) (not start!39358))
