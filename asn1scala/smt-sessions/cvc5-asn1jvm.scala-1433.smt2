; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39362 () Bool)

(assert start!39362)

(declare-fun b!176970 () Bool)

(declare-fun e!123332 () Bool)

(declare-fun e!123331 () Bool)

(assert (=> b!176970 (= e!123332 e!123331)))

(declare-fun res!146659 () Bool)

(assert (=> b!176970 (=> (not res!146659) (not e!123331))))

(declare-fun lt!272144 () (_ BitVec 64))

(declare-fun lt!272143 () (_ BitVec 64))

(assert (=> b!176970 (= res!146659 (= lt!272144 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272143)))))

(declare-datatypes ((array!9554 0))(
  ( (array!9555 (arr!5143 (Array (_ BitVec 32) (_ BitVec 8))) (size!4213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7534 0))(
  ( (BitStream!7535 (buf!4656 array!9554) (currentByte!8827 (_ BitVec 32)) (currentBit!8822 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12740 0))(
  ( (Unit!12741) )
))
(declare-datatypes ((tuple2!15242 0))(
  ( (tuple2!15243 (_1!8266 Unit!12740) (_2!8266 BitStream!7534)) )
))
(declare-fun lt!272142 () tuple2!15242)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176970 (= lt!272144 (bitIndex!0 (size!4213 (buf!4656 (_2!8266 lt!272142))) (currentByte!8827 (_2!8266 lt!272142)) (currentBit!8822 (_2!8266 lt!272142))))))

(declare-fun thiss!1204 () BitStream!7534)

(assert (=> b!176970 (= lt!272143 (bitIndex!0 (size!4213 (buf!4656 thiss!1204)) (currentByte!8827 thiss!1204) (currentBit!8822 thiss!1204)))))

(declare-fun b!176971 () Bool)

(declare-fun res!146662 () Bool)

(declare-fun e!123336 () Bool)

(assert (=> b!176971 (=> (not res!146662) (not e!123336))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176971 (= res!146662 (validate_offset_bits!1 ((_ sign_extend 32) (size!4213 (buf!4656 thiss!1204))) ((_ sign_extend 32) (currentByte!8827 thiss!1204)) ((_ sign_extend 32) (currentBit!8822 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176972 () Bool)

(declare-fun e!123335 () Bool)

(assert (=> b!176972 (= e!123335 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!176973 () Bool)

(declare-fun res!146666 () Bool)

(assert (=> b!176973 (=> (not res!146666) (not e!123336))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176973 (= res!146666 (invariant!0 (currentBit!8822 thiss!1204) (currentByte!8827 thiss!1204) (size!4213 (buf!4656 thiss!1204))))))

(declare-fun b!176974 () Bool)

(declare-fun e!123333 () Bool)

(assert (=> b!176974 (= e!123331 e!123333)))

(declare-fun res!146665 () Bool)

(assert (=> b!176974 (=> (not res!146665) (not e!123333))))

(declare-datatypes ((tuple2!15244 0))(
  ( (tuple2!15245 (_1!8267 BitStream!7534) (_2!8267 Bool)) )
))
(declare-fun lt!272141 () tuple2!15244)

(declare-fun lt!272140 () Bool)

(assert (=> b!176974 (= res!146665 (and (= (_2!8267 lt!272141) lt!272140) (= (_1!8267 lt!272141) (_2!8266 lt!272142))))))

(declare-fun readBitPure!0 (BitStream!7534) tuple2!15244)

(declare-fun readerFrom!0 (BitStream!7534 (_ BitVec 32) (_ BitVec 32)) BitStream!7534)

(assert (=> b!176974 (= lt!272141 (readBitPure!0 (readerFrom!0 (_2!8266 lt!272142) (currentBit!8822 thiss!1204) (currentByte!8827 thiss!1204))))))

(declare-fun b!176975 () Bool)

(declare-fun res!146663 () Bool)

(assert (=> b!176975 (=> (not res!146663) (not e!123336))))

(assert (=> b!176975 (= res!146663 (not (= i!590 nBits!348)))))

(declare-fun b!176976 () Bool)

(declare-fun e!123337 () Bool)

(declare-fun array_inv!3954 (array!9554) Bool)

(assert (=> b!176976 (= e!123337 (array_inv!3954 (buf!4656 thiss!1204)))))

(declare-fun res!146660 () Bool)

(assert (=> start!39362 (=> (not res!146660) (not e!123336))))

(assert (=> start!39362 (= res!146660 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39362 e!123336))

(assert (=> start!39362 true))

(declare-fun inv!12 (BitStream!7534) Bool)

(assert (=> start!39362 (and (inv!12 thiss!1204) e!123337)))

(declare-fun b!176977 () Bool)

(assert (=> b!176977 (= e!123336 (not e!123335))))

(declare-fun res!146667 () Bool)

(assert (=> b!176977 (=> res!146667 e!123335)))

(assert (=> b!176977 (= res!146667 (not (= (bitIndex!0 (size!4213 (buf!4656 (_2!8266 lt!272142))) (currentByte!8827 (_2!8266 lt!272142)) (currentBit!8822 (_2!8266 lt!272142))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4213 (buf!4656 thiss!1204)) (currentByte!8827 thiss!1204) (currentBit!8822 thiss!1204))))))))

(assert (=> b!176977 e!123332))

(declare-fun res!146661 () Bool)

(assert (=> b!176977 (=> (not res!146661) (not e!123332))))

(assert (=> b!176977 (= res!146661 (= (size!4213 (buf!4656 thiss!1204)) (size!4213 (buf!4656 (_2!8266 lt!272142)))))))

(declare-fun appendBit!0 (BitStream!7534 Bool) tuple2!15242)

(assert (=> b!176977 (= lt!272142 (appendBit!0 thiss!1204 lt!272140))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176977 (= lt!272140 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176978 () Bool)

(assert (=> b!176978 (= e!123333 (= (bitIndex!0 (size!4213 (buf!4656 (_1!8267 lt!272141))) (currentByte!8827 (_1!8267 lt!272141)) (currentBit!8822 (_1!8267 lt!272141))) lt!272144))))

(declare-fun b!176979 () Bool)

(declare-fun res!146664 () Bool)

(assert (=> b!176979 (=> (not res!146664) (not e!123331))))

(declare-fun isPrefixOf!0 (BitStream!7534 BitStream!7534) Bool)

(assert (=> b!176979 (= res!146664 (isPrefixOf!0 thiss!1204 (_2!8266 lt!272142)))))

(assert (= (and start!39362 res!146660) b!176971))

(assert (= (and b!176971 res!146662) b!176973))

(assert (= (and b!176973 res!146666) b!176975))

(assert (= (and b!176975 res!146663) b!176977))

(assert (= (and b!176977 res!146661) b!176970))

(assert (= (and b!176970 res!146659) b!176979))

(assert (= (and b!176979 res!146664) b!176974))

(assert (= (and b!176974 res!146665) b!176978))

(assert (= (and b!176977 (not res!146667)) b!176972))

(assert (= start!39362 b!176976))

(declare-fun m!276973 () Bool)

(assert (=> b!176978 m!276973))

(declare-fun m!276975 () Bool)

(assert (=> b!176977 m!276975))

(declare-fun m!276977 () Bool)

(assert (=> b!176977 m!276977))

(declare-fun m!276979 () Bool)

(assert (=> b!176977 m!276979))

(declare-fun m!276981 () Bool)

(assert (=> b!176973 m!276981))

(declare-fun m!276983 () Bool)

(assert (=> b!176971 m!276983))

(declare-fun m!276985 () Bool)

(assert (=> b!176979 m!276985))

(declare-fun m!276987 () Bool)

(assert (=> b!176976 m!276987))

(declare-fun m!276989 () Bool)

(assert (=> b!176974 m!276989))

(assert (=> b!176974 m!276989))

(declare-fun m!276991 () Bool)

(assert (=> b!176974 m!276991))

(assert (=> b!176970 m!276975))

(assert (=> b!176970 m!276977))

(declare-fun m!276993 () Bool)

(assert (=> start!39362 m!276993))

(push 1)

(assert (not b!176977))

(assert (not start!39362))

(assert (not b!176970))

(assert (not b!176978))

(assert (not b!176973))

(assert (not b!176976))

(assert (not b!176974))

(assert (not b!176971))

(assert (not b!176979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

