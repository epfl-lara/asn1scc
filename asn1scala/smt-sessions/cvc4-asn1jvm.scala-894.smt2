; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25442 () Bool)

(assert start!25442)

(declare-fun b!128403 () Bool)

(declare-fun e!85117 () Bool)

(declare-datatypes ((array!5927 0))(
  ( (array!5928 (arr!3296 (Array (_ BitVec 32) (_ BitVec 8))) (size!2679 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4622 0))(
  ( (BitStream!4623 (buf!3037 array!5927) (currentByte!5798 (_ BitVec 32)) (currentBit!5793 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4622)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128403 (= e!85117 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5793 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5798 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2679 (buf!3037 thiss!1634))))))))

(declare-fun b!128404 () Bool)

(declare-fun e!85119 () Bool)

(declare-fun array_inv!2468 (array!5927) Bool)

(assert (=> b!128404 (= e!85119 (array_inv!2468 (buf!3037 thiss!1634)))))

(declare-fun b!128405 () Bool)

(declare-fun res!106263 () Bool)

(declare-fun e!85120 () Bool)

(assert (=> b!128405 (=> (not res!106263) (not e!85120))))

(declare-datatypes ((Unit!7963 0))(
  ( (Unit!7964) )
))
(declare-datatypes ((tuple2!10840 0))(
  ( (tuple2!10841 (_1!5717 Unit!7963) (_2!5717 BitStream!4622)) )
))
(declare-fun lt!199421 () tuple2!10840)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128405 (= res!106263 (= (bitIndex!0 (size!2679 (buf!3037 (_2!5717 lt!199421))) (currentByte!5798 (_2!5717 lt!199421)) (currentBit!5793 (_2!5717 lt!199421))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2679 (buf!3037 thiss!1634)) (currentByte!5798 thiss!1634) (currentBit!5793 thiss!1634)))))))

(declare-fun res!106270 () Bool)

(declare-fun e!85118 () Bool)

(assert (=> start!25442 (=> (not res!106270) (not e!85118))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5927)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25442 (= res!106270 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2679 arr!237))))))

(assert (=> start!25442 e!85118))

(assert (=> start!25442 true))

(assert (=> start!25442 (array_inv!2468 arr!237)))

(declare-fun inv!12 (BitStream!4622) Bool)

(assert (=> start!25442 (and (inv!12 thiss!1634) e!85119)))

(declare-fun b!128406 () Bool)

(assert (=> b!128406 (= e!85118 (not e!85117))))

(declare-fun res!106265 () Bool)

(assert (=> b!128406 (=> res!106265 e!85117)))

(assert (=> b!128406 (= res!106265 (or (bvsgt ((_ sign_extend 32) (size!2679 (buf!3037 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5798 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5793 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!2679 (buf!3037 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5798 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5793 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128406 e!85120))

(declare-fun res!106267 () Bool)

(assert (=> b!128406 (=> (not res!106267) (not e!85120))))

(assert (=> b!128406 (= res!106267 (= (size!2679 (buf!3037 thiss!1634)) (size!2679 (buf!3037 (_2!5717 lt!199421)))))))

(declare-fun appendByte!0 (BitStream!4622 (_ BitVec 8)) tuple2!10840)

(assert (=> b!128406 (= lt!199421 (appendByte!0 thiss!1634 (select (arr!3296 arr!237) from!447)))))

(declare-fun b!128407 () Bool)

(declare-fun res!106264 () Bool)

(assert (=> b!128407 (=> (not res!106264) (not e!85118))))

(assert (=> b!128407 (= res!106264 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!10842 0))(
  ( (tuple2!10843 (_1!5718 BitStream!4622) (_2!5718 (_ BitVec 8))) )
))
(declare-fun lt!199419 () tuple2!10842)

(declare-fun b!128408 () Bool)

(declare-datatypes ((tuple2!10844 0))(
  ( (tuple2!10845 (_1!5719 BitStream!4622) (_2!5719 BitStream!4622)) )
))
(declare-fun lt!199420 () tuple2!10844)

(assert (=> b!128408 (= e!85120 (and (= (_2!5718 lt!199419) (select (arr!3296 arr!237) from!447)) (= (_1!5718 lt!199419) (_2!5719 lt!199420))))))

(declare-fun readBytePure!0 (BitStream!4622) tuple2!10842)

(assert (=> b!128408 (= lt!199419 (readBytePure!0 (_1!5719 lt!199420)))))

(declare-fun reader!0 (BitStream!4622 BitStream!4622) tuple2!10844)

(assert (=> b!128408 (= lt!199420 (reader!0 thiss!1634 (_2!5717 lt!199421)))))

(declare-fun b!128409 () Bool)

(declare-fun res!106268 () Bool)

(assert (=> b!128409 (=> (not res!106268) (not e!85118))))

(assert (=> b!128409 (= res!106268 (invariant!0 (currentBit!5793 thiss!1634) (currentByte!5798 thiss!1634) (size!2679 (buf!3037 thiss!1634))))))

(declare-fun b!128410 () Bool)

(declare-fun res!106266 () Bool)

(assert (=> b!128410 (=> (not res!106266) (not e!85118))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128410 (= res!106266 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2679 (buf!3037 thiss!1634))) ((_ sign_extend 32) (currentByte!5798 thiss!1634)) ((_ sign_extend 32) (currentBit!5793 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128411 () Bool)

(declare-fun res!106269 () Bool)

(assert (=> b!128411 (=> (not res!106269) (not e!85120))))

(declare-fun isPrefixOf!0 (BitStream!4622 BitStream!4622) Bool)

(assert (=> b!128411 (= res!106269 (isPrefixOf!0 thiss!1634 (_2!5717 lt!199421)))))

(assert (= (and start!25442 res!106270) b!128410))

(assert (= (and b!128410 res!106266) b!128407))

(assert (= (and b!128407 res!106264) b!128409))

(assert (= (and b!128409 res!106268) b!128406))

(assert (= (and b!128406 res!106267) b!128405))

(assert (= (and b!128405 res!106263) b!128411))

(assert (= (and b!128411 res!106269) b!128408))

(assert (= (and b!128406 (not res!106265)) b!128403))

(assert (= start!25442 b!128404))

(declare-fun m!194195 () Bool)

(assert (=> start!25442 m!194195))

(declare-fun m!194197 () Bool)

(assert (=> start!25442 m!194197))

(declare-fun m!194199 () Bool)

(assert (=> b!128410 m!194199))

(declare-fun m!194201 () Bool)

(assert (=> b!128406 m!194201))

(assert (=> b!128406 m!194201))

(declare-fun m!194203 () Bool)

(assert (=> b!128406 m!194203))

(assert (=> b!128408 m!194201))

(declare-fun m!194205 () Bool)

(assert (=> b!128408 m!194205))

(declare-fun m!194207 () Bool)

(assert (=> b!128408 m!194207))

(declare-fun m!194209 () Bool)

(assert (=> b!128411 m!194209))

(declare-fun m!194211 () Bool)

(assert (=> b!128405 m!194211))

(declare-fun m!194213 () Bool)

(assert (=> b!128405 m!194213))

(declare-fun m!194215 () Bool)

(assert (=> b!128409 m!194215))

(declare-fun m!194217 () Bool)

(assert (=> b!128404 m!194217))

(declare-fun m!194219 () Bool)

(assert (=> b!128403 m!194219))

(push 1)

(assert (not b!128411))

(assert (not b!128406))

(assert (not start!25442))

(assert (not b!128403))

(assert (not b!128409))

(assert (not b!128404))

(assert (not b!128405))

(assert (not b!128408))

(assert (not b!128410))

