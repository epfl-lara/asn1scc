; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57396 () Bool)

(assert start!57396)

(declare-fun b!263007 () Bool)

(declare-fun e!183231 () Bool)

(assert (=> b!263007 (= e!183231 true)))

(declare-fun lt!404556 () (_ BitVec 64))

(declare-datatypes ((array!14672 0))(
  ( (array!14673 (arr!7390 (Array (_ BitVec 32) (_ BitVec 8))) (size!6403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11620 0))(
  ( (BitStream!11621 (buf!6871 array!14672) (currentByte!12723 (_ BitVec 32)) (currentBit!12718 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11620)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263007 (= lt!404556 (bitIndex!0 (size!6403 (buf!6871 w1!584)) (currentByte!12723 w1!584) (currentBit!12718 w1!584)))))

(declare-fun b!263008 () Bool)

(declare-fun e!183234 () Bool)

(assert (=> b!263008 (= e!183234 (not e!183231))))

(declare-fun res!220075 () Bool)

(assert (=> b!263008 (=> res!220075 e!183231)))

(declare-fun e!183233 () Bool)

(assert (=> b!263008 (= res!220075 e!183233)))

(declare-fun res!220073 () Bool)

(assert (=> b!263008 (=> (not res!220073) (not e!183233))))

(assert (=> b!263008 (= res!220073 (not (= (size!6403 (buf!6871 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11620)

(declare-fun isPrefixOf!0 (BitStream!11620 BitStream!11620) Bool)

(assert (=> b!263008 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18749 0))(
  ( (Unit!18750) )
))
(declare-fun lt!404557 () Unit!18749)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11620) Unit!18749)

(assert (=> b!263008 (= lt!404557 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404558 () BitStream!11620)

(assert (=> b!263008 (isPrefixOf!0 lt!404558 lt!404558)))

(declare-fun lt!404555 () Unit!18749)

(assert (=> b!263008 (= lt!404555 (lemmaIsPrefixRefl!0 lt!404558))))

(assert (=> b!263008 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404554 () Unit!18749)

(assert (=> b!263008 (= lt!404554 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263008 (= lt!404558 (BitStream!11621 (buf!6871 w2!580) (currentByte!12723 w1!584) (currentBit!12718 w1!584)))))

(declare-fun b!263009 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14672 array!14672 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!263009 (= e!183233 (not (arrayBitRangesEq!0 (buf!6871 w1!584) (buf!6871 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6403 (buf!6871 w1!584)) (currentByte!12723 w1!584) (currentBit!12718 w1!584)))))))

(declare-fun res!220072 () Bool)

(assert (=> start!57396 (=> (not res!220072) (not e!183234))))

(assert (=> start!57396 (= res!220072 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57396 e!183234))

(declare-fun e!183228 () Bool)

(declare-fun inv!12 (BitStream!11620) Bool)

(assert (=> start!57396 (and (inv!12 w1!584) e!183228)))

(declare-fun e!183230 () Bool)

(assert (=> start!57396 (and (inv!12 w2!580) e!183230)))

(declare-fun b!263010 () Bool)

(declare-fun array_inv!6127 (array!14672) Bool)

(assert (=> b!263010 (= e!183228 (array_inv!6127 (buf!6871 w1!584)))))

(declare-fun b!263011 () Bool)

(assert (=> b!263011 (= e!183230 (array_inv!6127 (buf!6871 w2!580)))))

(declare-fun b!263012 () Bool)

(declare-fun res!220074 () Bool)

(assert (=> b!263012 (=> res!220074 e!183231)))

(assert (=> b!263012 (= res!220074 (= (size!6403 (buf!6871 w1!584)) #b00000000000000000000000000000000))))

(assert (= (and start!57396 res!220072) b!263008))

(assert (= (and b!263008 res!220073) b!263009))

(assert (= (and b!263008 (not res!220075)) b!263012))

(assert (= (and b!263012 (not res!220074)) b!263007))

(assert (= start!57396 b!263010))

(assert (= start!57396 b!263011))

(declare-fun m!393197 () Bool)

(assert (=> b!263010 m!393197))

(declare-fun m!393199 () Bool)

(assert (=> b!263007 m!393199))

(declare-fun m!393201 () Bool)

(assert (=> b!263008 m!393201))

(declare-fun m!393203 () Bool)

(assert (=> b!263008 m!393203))

(declare-fun m!393205 () Bool)

(assert (=> b!263008 m!393205))

(declare-fun m!393207 () Bool)

(assert (=> b!263008 m!393207))

(declare-fun m!393209 () Bool)

(assert (=> b!263008 m!393209))

(declare-fun m!393211 () Bool)

(assert (=> b!263008 m!393211))

(assert (=> b!263009 m!393199))

(assert (=> b!263009 m!393199))

(declare-fun m!393213 () Bool)

(assert (=> b!263009 m!393213))

(declare-fun m!393215 () Bool)

(assert (=> b!263011 m!393215))

(declare-fun m!393217 () Bool)

(assert (=> start!57396 m!393217))

(declare-fun m!393219 () Bool)

(assert (=> start!57396 m!393219))

(declare-fun m!393221 () Bool)

(assert (=> start!57396 m!393221))

(push 1)

(assert (not b!263011))

(assert (not b!263008))

(assert (not b!263009))

(assert (not start!57396))

(assert (not b!263007))

(assert (not b!263010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

