; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27354 () Bool)

(assert start!27354)

(declare-fun b!140425 () Bool)

(declare-fun res!117080 () Bool)

(declare-fun e!93594 () Bool)

(assert (=> b!140425 (=> (not res!117080) (not e!93594))))

(declare-datatypes ((array!6420 0))(
  ( (array!6421 (arr!3612 (Array (_ BitVec 32) (_ BitVec 8))) (size!2905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5068 0))(
  ( (BitStream!5069 (buf!3326 array!6420) (currentByte!6177 (_ BitVec 32)) (currentBit!6172 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8789 0))(
  ( (Unit!8790) )
))
(declare-datatypes ((tuple2!12304 0))(
  ( (tuple2!12305 (_1!6482 Unit!8789) (_2!6482 BitStream!5068)) )
))
(declare-fun lt!218725 () tuple2!12304)

(declare-fun thiss!1634 () BitStream!5068)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140425 (= res!117080 (= (bitIndex!0 (size!2905 (buf!3326 (_2!6482 lt!218725))) (currentByte!6177 (_2!6482 lt!218725)) (currentBit!6172 (_2!6482 lt!218725))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2905 (buf!3326 thiss!1634)) (currentByte!6177 thiss!1634) (currentBit!6172 thiss!1634)))))))

(declare-fun b!140426 () Bool)

(declare-fun res!117084 () Bool)

(declare-fun e!93592 () Bool)

(assert (=> b!140426 (=> (not res!117084) (not e!93592))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140426 (= res!117084 (invariant!0 (currentBit!6172 thiss!1634) (currentByte!6177 thiss!1634) (size!2905 (buf!3326 thiss!1634))))))

(declare-fun b!140427 () Bool)

(declare-fun res!117085 () Bool)

(assert (=> b!140427 (=> (not res!117085) (not e!93592))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140427 (= res!117085 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12306 0))(
  ( (tuple2!12307 (_1!6483 BitStream!5068) (_2!6483 (_ BitVec 8))) )
))
(declare-fun lt!218726 () tuple2!12306)

(declare-datatypes ((tuple2!12308 0))(
  ( (tuple2!12309 (_1!6484 BitStream!5068) (_2!6484 BitStream!5068)) )
))
(declare-fun lt!218724 () tuple2!12308)

(declare-fun arr!237 () array!6420)

(declare-fun b!140428 () Bool)

(assert (=> b!140428 (= e!93594 (and (= (_2!6483 lt!218726) (select (arr!3612 arr!237) from!447)) (= (_1!6483 lt!218726) (_2!6484 lt!218724))))))

(declare-fun readBytePure!0 (BitStream!5068) tuple2!12306)

(assert (=> b!140428 (= lt!218726 (readBytePure!0 (_1!6484 lt!218724)))))

(declare-fun reader!0 (BitStream!5068 BitStream!5068) tuple2!12308)

(assert (=> b!140428 (= lt!218724 (reader!0 thiss!1634 (_2!6482 lt!218725)))))

(declare-fun b!140429 () Bool)

(declare-fun res!117083 () Bool)

(assert (=> b!140429 (=> (not res!117083) (not e!93594))))

(declare-fun isPrefixOf!0 (BitStream!5068 BitStream!5068) Bool)

(assert (=> b!140429 (= res!117083 (isPrefixOf!0 thiss!1634 (_2!6482 lt!218725)))))

(declare-fun b!140430 () Bool)

(assert (=> b!140430 (= e!93592 (not true))))

(assert (=> b!140430 e!93594))

(declare-fun res!117079 () Bool)

(assert (=> b!140430 (=> (not res!117079) (not e!93594))))

(assert (=> b!140430 (= res!117079 (= (size!2905 (buf!3326 thiss!1634)) (size!2905 (buf!3326 (_2!6482 lt!218725)))))))

(declare-fun appendByte!0 (BitStream!5068 (_ BitVec 8)) tuple2!12304)

(assert (=> b!140430 (= lt!218725 (appendByte!0 thiss!1634 (select (arr!3612 arr!237) from!447)))))

(declare-fun b!140431 () Bool)

(declare-fun e!93593 () Bool)

(declare-fun array_inv!2694 (array!6420) Bool)

(assert (=> b!140431 (= e!93593 (array_inv!2694 (buf!3326 thiss!1634)))))

(declare-fun res!117081 () Bool)

(assert (=> start!27354 (=> (not res!117081) (not e!93592))))

(assert (=> start!27354 (= res!117081 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2905 arr!237))))))

(assert (=> start!27354 e!93592))

(assert (=> start!27354 true))

(assert (=> start!27354 (array_inv!2694 arr!237)))

(declare-fun inv!12 (BitStream!5068) Bool)

(assert (=> start!27354 (and (inv!12 thiss!1634) e!93593)))

(declare-fun b!140432 () Bool)

(declare-fun res!117082 () Bool)

(assert (=> b!140432 (=> (not res!117082) (not e!93592))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140432 (= res!117082 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2905 (buf!3326 thiss!1634))) ((_ sign_extend 32) (currentByte!6177 thiss!1634)) ((_ sign_extend 32) (currentBit!6172 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27354 res!117081) b!140432))

(assert (= (and b!140432 res!117082) b!140427))

(assert (= (and b!140427 res!117085) b!140426))

(assert (= (and b!140426 res!117084) b!140430))

(assert (= (and b!140430 res!117079) b!140425))

(assert (= (and b!140425 res!117080) b!140429))

(assert (= (and b!140429 res!117083) b!140428))

(assert (= start!27354 b!140431))

(declare-fun m!216209 () Bool)

(assert (=> start!27354 m!216209))

(declare-fun m!216211 () Bool)

(assert (=> start!27354 m!216211))

(declare-fun m!216213 () Bool)

(assert (=> b!140431 m!216213))

(declare-fun m!216215 () Bool)

(assert (=> b!140432 m!216215))

(declare-fun m!216217 () Bool)

(assert (=> b!140430 m!216217))

(assert (=> b!140430 m!216217))

(declare-fun m!216219 () Bool)

(assert (=> b!140430 m!216219))

(assert (=> b!140428 m!216217))

(declare-fun m!216221 () Bool)

(assert (=> b!140428 m!216221))

(declare-fun m!216223 () Bool)

(assert (=> b!140428 m!216223))

(declare-fun m!216225 () Bool)

(assert (=> b!140429 m!216225))

(declare-fun m!216227 () Bool)

(assert (=> b!140425 m!216227))

(declare-fun m!216229 () Bool)

(assert (=> b!140425 m!216229))

(declare-fun m!216231 () Bool)

(assert (=> b!140426 m!216231))

(push 1)

(assert (not b!140425))

(assert (not b!140429))

(assert (not b!140431))

(assert (not b!140428))

(assert (not b!140430))

(assert (not b!140432))

(assert (not start!27354))

(assert (not b!140426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

