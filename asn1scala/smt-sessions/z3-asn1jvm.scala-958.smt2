; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27076 () Bool)

(assert start!27076)

(declare-fun b!139298 () Bool)

(declare-fun e!92768 () Bool)

(declare-datatypes ((array!6341 0))(
  ( (array!6342 (arr!3565 (Array (_ BitVec 32) (_ BitVec 8))) (size!2870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5004 0))(
  ( (BitStream!5005 (buf!3286 array!6341) (currentByte!6116 (_ BitVec 32)) (currentBit!6111 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5004)

(declare-fun array_inv!2659 (array!6341) Bool)

(assert (=> b!139298 (= e!92768 (array_inv!2659 (buf!3286 thiss!1634)))))

(declare-fun res!116116 () Bool)

(declare-fun e!92769 () Bool)

(assert (=> start!27076 (=> (not res!116116) (not e!92769))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6341)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27076 (= res!116116 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2870 arr!237))))))

(assert (=> start!27076 e!92769))

(assert (=> start!27076 true))

(assert (=> start!27076 (array_inv!2659 arr!237)))

(declare-fun inv!12 (BitStream!5004) Bool)

(assert (=> start!27076 (and (inv!12 thiss!1634) e!92768)))

(declare-fun b!139299 () Bool)

(declare-fun e!92771 () Bool)

(assert (=> b!139299 (= e!92769 (not e!92771))))

(declare-fun res!116117 () Bool)

(assert (=> b!139299 (=> res!116117 e!92771)))

(declare-fun lt!217210 () (_ BitVec 64))

(declare-fun lt!217215 () (_ BitVec 64))

(assert (=> b!139299 (= res!116117 (not (= lt!217210 (bvadd lt!217210 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217215)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139299 (= lt!217210 (bitIndex!0 (size!2870 (buf!3286 thiss!1634)) (currentByte!6116 thiss!1634) (currentBit!6111 thiss!1634)))))

(assert (=> b!139299 (= lt!217215 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5004 BitStream!5004) Bool)

(assert (=> b!139299 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8699 0))(
  ( (Unit!8700) )
))
(declare-fun lt!217213 () Unit!8699)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5004) Unit!8699)

(assert (=> b!139299 (= lt!217213 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139300 () Bool)

(assert (=> b!139300 (= e!92771 true)))

(declare-datatypes ((tuple2!12198 0))(
  ( (tuple2!12199 (_1!6425 BitStream!5004) (_2!6425 BitStream!5004)) )
))
(declare-fun lt!217212 () tuple2!12198)

(declare-datatypes ((tuple2!12200 0))(
  ( (tuple2!12201 (_1!6426 BitStream!5004) (_2!6426 array!6341)) )
))
(declare-fun lt!217211 () tuple2!12200)

(declare-fun readByteArrayLoopPure!0 (BitStream!5004 array!6341 (_ BitVec 32) (_ BitVec 32)) tuple2!12200)

(assert (=> b!139300 (= lt!217211 (readByteArrayLoopPure!0 (_1!6425 lt!217212) arr!237 from!447 to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139300 (validate_offset_bits!1 ((_ sign_extend 32) (size!2870 (buf!3286 thiss!1634))) ((_ sign_extend 32) (currentByte!6116 thiss!1634)) ((_ sign_extend 32) (currentBit!6111 thiss!1634)) lt!217215)))

(declare-fun lt!217214 () Unit!8699)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5004 array!6341 (_ BitVec 64)) Unit!8699)

(assert (=> b!139300 (= lt!217214 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3286 thiss!1634) lt!217215))))

(declare-fun reader!0 (BitStream!5004 BitStream!5004) tuple2!12198)

(assert (=> b!139300 (= lt!217212 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139301 () Bool)

(declare-fun res!116118 () Bool)

(assert (=> b!139301 (=> (not res!116118) (not e!92769))))

(assert (=> b!139301 (= res!116118 (bvsge from!447 to!404))))

(declare-fun b!139302 () Bool)

(declare-fun res!116115 () Bool)

(assert (=> b!139302 (=> (not res!116115) (not e!92769))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139302 (= res!116115 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2870 (buf!3286 thiss!1634))) ((_ sign_extend 32) (currentByte!6116 thiss!1634)) ((_ sign_extend 32) (currentBit!6111 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27076 res!116116) b!139302))

(assert (= (and b!139302 res!116115) b!139301))

(assert (= (and b!139301 res!116118) b!139299))

(assert (= (and b!139299 (not res!116117)) b!139300))

(assert (= start!27076 b!139298))

(declare-fun m!214295 () Bool)

(assert (=> start!27076 m!214295))

(declare-fun m!214297 () Bool)

(assert (=> start!27076 m!214297))

(declare-fun m!214299 () Bool)

(assert (=> b!139302 m!214299))

(declare-fun m!214301 () Bool)

(assert (=> b!139298 m!214301))

(declare-fun m!214303 () Bool)

(assert (=> b!139300 m!214303))

(declare-fun m!214305 () Bool)

(assert (=> b!139300 m!214305))

(declare-fun m!214307 () Bool)

(assert (=> b!139300 m!214307))

(declare-fun m!214309 () Bool)

(assert (=> b!139300 m!214309))

(declare-fun m!214311 () Bool)

(assert (=> b!139299 m!214311))

(declare-fun m!214313 () Bool)

(assert (=> b!139299 m!214313))

(declare-fun m!214315 () Bool)

(assert (=> b!139299 m!214315))

(check-sat (not b!139299) (not b!139302) (not start!27076) (not b!139300) (not b!139298))
