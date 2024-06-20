; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27068 () Bool)

(assert start!27068)

(declare-fun res!116070 () Bool)

(declare-fun e!92710 () Bool)

(assert (=> start!27068 (=> (not res!116070) (not e!92710))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((array!6333 0))(
  ( (array!6334 (arr!3561 (Array (_ BitVec 32) (_ BitVec 8))) (size!2866 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6333)

(assert (=> start!27068 (= res!116070 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2866 arr!237))))))

(assert (=> start!27068 e!92710))

(assert (=> start!27068 true))

(declare-fun array_inv!2655 (array!6333) Bool)

(assert (=> start!27068 (array_inv!2655 arr!237)))

(declare-datatypes ((BitStream!4996 0))(
  ( (BitStream!4997 (buf!3282 array!6333) (currentByte!6112 (_ BitVec 32)) (currentBit!6107 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4996)

(declare-fun e!92708 () Bool)

(declare-fun inv!12 (BitStream!4996) Bool)

(assert (=> start!27068 (and (inv!12 thiss!1634) e!92708)))

(declare-fun b!139238 () Bool)

(declare-fun res!116069 () Bool)

(assert (=> b!139238 (=> (not res!116069) (not e!92710))))

(assert (=> b!139238 (= res!116069 (bvsge from!447 to!404))))

(declare-fun b!139239 () Bool)

(declare-datatypes ((tuple2!12182 0))(
  ( (tuple2!12183 (_1!6417 BitStream!4996) (_2!6417 BitStream!4996)) )
))
(declare-fun lt!217140 () tuple2!12182)

(declare-fun e!92712 () Bool)

(declare-datatypes ((tuple2!12184 0))(
  ( (tuple2!12185 (_1!6418 BitStream!4996) (_2!6418 array!6333)) )
))
(declare-fun lt!217143 () tuple2!12184)

(assert (=> b!139239 (= e!92712 (or (not (= (size!2866 (_2!6418 lt!217143)) (size!2866 arr!237))) (not (= (_1!6418 lt!217143) (_2!6417 lt!217140))) (bvsle #b00000000000000000000000000000000 to!404)))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4996 array!6333 (_ BitVec 32) (_ BitVec 32)) tuple2!12184)

(assert (=> b!139239 (= lt!217143 (readByteArrayLoopPure!0 (_1!6417 lt!217140) arr!237 from!447 to!404))))

(declare-fun lt!217138 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139239 (validate_offset_bits!1 ((_ sign_extend 32) (size!2866 (buf!3282 thiss!1634))) ((_ sign_extend 32) (currentByte!6112 thiss!1634)) ((_ sign_extend 32) (currentBit!6107 thiss!1634)) lt!217138)))

(declare-datatypes ((Unit!8691 0))(
  ( (Unit!8692) )
))
(declare-fun lt!217139 () Unit!8691)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4996 array!6333 (_ BitVec 64)) Unit!8691)

(assert (=> b!139239 (= lt!217139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3282 thiss!1634) lt!217138))))

(declare-fun reader!0 (BitStream!4996 BitStream!4996) tuple2!12182)

(assert (=> b!139239 (= lt!217140 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139240 () Bool)

(assert (=> b!139240 (= e!92710 (not e!92712))))

(declare-fun res!116068 () Bool)

(assert (=> b!139240 (=> res!116068 e!92712)))

(declare-fun lt!217141 () (_ BitVec 64))

(assert (=> b!139240 (= res!116068 (not (= lt!217141 (bvadd lt!217141 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217138)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139240 (= lt!217141 (bitIndex!0 (size!2866 (buf!3282 thiss!1634)) (currentByte!6112 thiss!1634) (currentBit!6107 thiss!1634)))))

(assert (=> b!139240 (= lt!217138 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4996 BitStream!4996) Bool)

(assert (=> b!139240 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!217142 () Unit!8691)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4996) Unit!8691)

(assert (=> b!139240 (= lt!217142 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139241 () Bool)

(declare-fun res!116067 () Bool)

(assert (=> b!139241 (=> (not res!116067) (not e!92710))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139241 (= res!116067 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2866 (buf!3282 thiss!1634))) ((_ sign_extend 32) (currentByte!6112 thiss!1634)) ((_ sign_extend 32) (currentBit!6107 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139242 () Bool)

(assert (=> b!139242 (= e!92708 (array_inv!2655 (buf!3282 thiss!1634)))))

(assert (= (and start!27068 res!116070) b!139241))

(assert (= (and b!139241 res!116067) b!139238))

(assert (= (and b!139238 res!116069) b!139240))

(assert (= (and b!139240 (not res!116068)) b!139239))

(assert (= start!27068 b!139242))

(declare-fun m!214207 () Bool)

(assert (=> b!139241 m!214207))

(declare-fun m!214209 () Bool)

(assert (=> b!139240 m!214209))

(declare-fun m!214211 () Bool)

(assert (=> b!139240 m!214211))

(declare-fun m!214213 () Bool)

(assert (=> b!139240 m!214213))

(declare-fun m!214215 () Bool)

(assert (=> start!27068 m!214215))

(declare-fun m!214217 () Bool)

(assert (=> start!27068 m!214217))

(declare-fun m!214219 () Bool)

(assert (=> b!139239 m!214219))

(declare-fun m!214221 () Bool)

(assert (=> b!139239 m!214221))

(declare-fun m!214223 () Bool)

(assert (=> b!139239 m!214223))

(declare-fun m!214225 () Bool)

(assert (=> b!139239 m!214225))

(declare-fun m!214227 () Bool)

(assert (=> b!139242 m!214227))

(push 1)

(assert (not start!27068))

(assert (not b!139242))

(assert (not b!139240))

(assert (not b!139241))

(assert (not b!139239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

