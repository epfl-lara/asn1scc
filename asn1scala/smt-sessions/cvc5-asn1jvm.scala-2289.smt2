; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58032 () Bool)

(assert start!58032)

(declare-fun b!266385 () Bool)

(declare-fun e!186322 () Bool)

(declare-datatypes ((array!14846 0))(
  ( (array!14847 (arr!7459 (Array (_ BitVec 32) (_ BitVec 8))) (size!6472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11758 0))(
  ( (BitStream!11759 (buf!6940 array!14846) (currentByte!12834 (_ BitVec 32)) (currentBit!12829 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11758)

(declare-fun w2!580 () BitStream!11758)

(declare-fun arrayBitRangesEq!0 (array!14846 array!14846 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266385 (= e!186322 (not (arrayBitRangesEq!0 (buf!6940 w1!584) (buf!6940 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6472 (buf!6940 w1!584)) (currentByte!12834 w1!584) (currentBit!12829 w1!584)))))))

(declare-fun res!222534 () Bool)

(declare-fun e!186321 () Bool)

(assert (=> start!58032 (=> (not res!222534) (not e!186321))))

(declare-fun isPrefixOf!0 (BitStream!11758 BitStream!11758) Bool)

(assert (=> start!58032 (= res!222534 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58032 e!186321))

(declare-fun e!186327 () Bool)

(declare-fun inv!12 (BitStream!11758) Bool)

(assert (=> start!58032 (and (inv!12 w1!584) e!186327)))

(declare-fun e!186329 () Bool)

(assert (=> start!58032 (and (inv!12 w2!580) e!186329)))

(declare-fun b!266386 () Bool)

(declare-fun e!186328 () Bool)

(declare-fun e!186326 () Bool)

(assert (=> b!266386 (= e!186328 e!186326)))

(declare-fun res!222532 () Bool)

(assert (=> b!266386 (=> res!222532 e!186326)))

(declare-fun e!186325 () Bool)

(assert (=> b!266386 (= res!222532 e!186325)))

(declare-fun res!222535 () Bool)

(assert (=> b!266386 (=> (not res!222535) (not e!186325))))

(assert (=> b!266386 (= res!222535 (not (= (size!6472 (buf!6940 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18914 0))(
  ( (Unit!18915) )
))
(declare-fun lt!407124 () Unit!18914)

(declare-fun e!186324 () Unit!18914)

(assert (=> b!266386 (= lt!407124 e!186324)))

(declare-fun c!12255 () Bool)

(assert (=> b!266386 (= c!12255 (not (= (size!6472 (buf!6940 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266387 () Bool)

(declare-fun array_inv!6196 (array!14846) Bool)

(assert (=> b!266387 (= e!186329 (array_inv!6196 (buf!6940 w2!580)))))

(declare-fun b!266388 () Bool)

(assert (=> b!266388 (= e!186325 (not (arrayBitRangesEq!0 (buf!6940 w2!580) (buf!6940 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6472 (buf!6940 w1!584)) (currentByte!12834 w1!584) (currentBit!12829 w1!584)))))))

(declare-fun b!266389 () Bool)

(declare-fun Unit!18916 () Unit!18914)

(assert (=> b!266389 (= e!186324 Unit!18916)))

(declare-fun b!266390 () Bool)

(assert (=> b!266390 (= e!186321 (not e!186328))))

(declare-fun res!222533 () Bool)

(assert (=> b!266390 (=> res!222533 e!186328)))

(assert (=> b!266390 (= res!222533 e!186322)))

(declare-fun res!222531 () Bool)

(assert (=> b!266390 (=> (not res!222531) (not e!186322))))

(assert (=> b!266390 (= res!222531 (not (= (size!6472 (buf!6940 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266390 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407121 () Unit!18914)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11758) Unit!18914)

(assert (=> b!266390 (= lt!407121 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407119 () BitStream!11758)

(assert (=> b!266390 (isPrefixOf!0 lt!407119 lt!407119)))

(declare-fun lt!407122 () Unit!18914)

(assert (=> b!266390 (= lt!407122 (lemmaIsPrefixRefl!0 lt!407119))))

(assert (=> b!266390 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407126 () Unit!18914)

(assert (=> b!266390 (= lt!407126 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266390 (= lt!407119 (BitStream!11759 (buf!6940 w2!580) (currentByte!12834 w1!584) (currentBit!12829 w1!584)))))

(declare-fun b!266391 () Bool)

(declare-fun lt!407120 () Unit!18914)

(assert (=> b!266391 (= e!186324 lt!407120)))

(declare-fun lt!407125 () (_ BitVec 64))

(assert (=> b!266391 (= lt!407125 (bitIndex!0 (size!6472 (buf!6940 w1!584)) (currentByte!12834 w1!584) (currentBit!12829 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14846 array!14846 (_ BitVec 64) (_ BitVec 64)) Unit!18914)

(assert (=> b!266391 (= lt!407120 (arrayBitRangesEqSymmetric!0 (buf!6940 w1!584) (buf!6940 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407125))))

(assert (=> b!266391 (arrayBitRangesEq!0 (buf!6940 w2!580) (buf!6940 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407125)))

(declare-fun b!266392 () Bool)

(assert (=> b!266392 (= e!186326 true)))

(declare-fun lt!407123 () Bool)

(assert (=> b!266392 (= lt!407123 (isPrefixOf!0 lt!407119 w1!584))))

(declare-fun b!266393 () Bool)

(assert (=> b!266393 (= e!186327 (array_inv!6196 (buf!6940 w1!584)))))

(assert (= (and start!58032 res!222534) b!266390))

(assert (= (and b!266390 res!222531) b!266385))

(assert (= (and b!266390 (not res!222533)) b!266386))

(assert (= (and b!266386 c!12255) b!266391))

(assert (= (and b!266386 (not c!12255)) b!266389))

(assert (= (and b!266386 res!222535) b!266388))

(assert (= (and b!266386 (not res!222532)) b!266392))

(assert (= start!58032 b!266393))

(assert (= start!58032 b!266387))

(declare-fun m!397181 () Bool)

(assert (=> b!266385 m!397181))

(assert (=> b!266385 m!397181))

(declare-fun m!397183 () Bool)

(assert (=> b!266385 m!397183))

(declare-fun m!397185 () Bool)

(assert (=> b!266387 m!397185))

(assert (=> b!266388 m!397181))

(assert (=> b!266388 m!397181))

(declare-fun m!397187 () Bool)

(assert (=> b!266388 m!397187))

(declare-fun m!397189 () Bool)

(assert (=> b!266393 m!397189))

(declare-fun m!397191 () Bool)

(assert (=> b!266390 m!397191))

(declare-fun m!397193 () Bool)

(assert (=> b!266390 m!397193))

(declare-fun m!397195 () Bool)

(assert (=> b!266390 m!397195))

(declare-fun m!397197 () Bool)

(assert (=> b!266390 m!397197))

(declare-fun m!397199 () Bool)

(assert (=> b!266390 m!397199))

(declare-fun m!397201 () Bool)

(assert (=> b!266390 m!397201))

(assert (=> b!266391 m!397181))

(declare-fun m!397203 () Bool)

(assert (=> b!266391 m!397203))

(declare-fun m!397205 () Bool)

(assert (=> b!266391 m!397205))

(declare-fun m!397207 () Bool)

(assert (=> start!58032 m!397207))

(declare-fun m!397209 () Bool)

(assert (=> start!58032 m!397209))

(declare-fun m!397211 () Bool)

(assert (=> start!58032 m!397211))

(declare-fun m!397213 () Bool)

(assert (=> b!266392 m!397213))

(push 1)

(assert (not b!266391))

(assert (not start!58032))

(assert (not b!266385))

(assert (not b!266387))

(assert (not b!266392))

(assert (not b!266390))

(assert (not b!266388))

(assert (not b!266393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

