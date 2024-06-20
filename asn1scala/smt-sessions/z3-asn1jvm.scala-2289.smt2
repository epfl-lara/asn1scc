; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58034 () Bool)

(assert start!58034)

(declare-fun b!266412 () Bool)

(declare-fun e!186359 () Bool)

(assert (=> b!266412 (= e!186359 true)))

(declare-fun lt!407149 () Bool)

(declare-datatypes ((array!14848 0))(
  ( (array!14849 (arr!7460 (Array (_ BitVec 32) (_ BitVec 8))) (size!6473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11760 0))(
  ( (BitStream!11761 (buf!6941 array!14848) (currentByte!12835 (_ BitVec 32)) (currentBit!12830 (_ BitVec 32))) )
))
(declare-fun lt!407143 () BitStream!11760)

(declare-fun w1!584 () BitStream!11760)

(declare-fun isPrefixOf!0 (BitStream!11760 BitStream!11760) Bool)

(assert (=> b!266412 (= lt!407149 (isPrefixOf!0 lt!407143 w1!584))))

(declare-fun b!266413 () Bool)

(declare-fun e!186355 () Bool)

(declare-fun array_inv!6197 (array!14848) Bool)

(assert (=> b!266413 (= e!186355 (array_inv!6197 (buf!6941 w1!584)))))

(declare-fun b!266414 () Bool)

(declare-datatypes ((Unit!18917 0))(
  ( (Unit!18918) )
))
(declare-fun e!186353 () Unit!18917)

(declare-fun lt!407150 () Unit!18917)

(assert (=> b!266414 (= e!186353 lt!407150)))

(declare-fun lt!407147 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266414 (= lt!407147 (bitIndex!0 (size!6473 (buf!6941 w1!584)) (currentByte!12835 w1!584) (currentBit!12830 w1!584)))))

(declare-fun w2!580 () BitStream!11760)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14848 array!14848 (_ BitVec 64) (_ BitVec 64)) Unit!18917)

(assert (=> b!266414 (= lt!407150 (arrayBitRangesEqSymmetric!0 (buf!6941 w1!584) (buf!6941 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407147))))

(declare-fun arrayBitRangesEq!0 (array!14848 array!14848 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266414 (arrayBitRangesEq!0 (buf!6941 w2!580) (buf!6941 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407147)))

(declare-fun res!222548 () Bool)

(declare-fun e!186357 () Bool)

(assert (=> start!58034 (=> (not res!222548) (not e!186357))))

(assert (=> start!58034 (= res!222548 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58034 e!186357))

(declare-fun inv!12 (BitStream!11760) Bool)

(assert (=> start!58034 (and (inv!12 w1!584) e!186355)))

(declare-fun e!186352 () Bool)

(assert (=> start!58034 (and (inv!12 w2!580) e!186352)))

(declare-fun b!266415 () Bool)

(assert (=> b!266415 (= e!186352 (array_inv!6197 (buf!6941 w2!580)))))

(declare-fun b!266416 () Bool)

(declare-fun e!186354 () Bool)

(assert (=> b!266416 (= e!186357 (not e!186354))))

(declare-fun res!222546 () Bool)

(assert (=> b!266416 (=> res!222546 e!186354)))

(declare-fun e!186351 () Bool)

(assert (=> b!266416 (= res!222546 e!186351)))

(declare-fun res!222550 () Bool)

(assert (=> b!266416 (=> (not res!222550) (not e!186351))))

(assert (=> b!266416 (= res!222550 (not (= (size!6473 (buf!6941 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266416 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407146 () Unit!18917)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11760) Unit!18917)

(assert (=> b!266416 (= lt!407146 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266416 (isPrefixOf!0 lt!407143 lt!407143)))

(declare-fun lt!407148 () Unit!18917)

(assert (=> b!266416 (= lt!407148 (lemmaIsPrefixRefl!0 lt!407143))))

(assert (=> b!266416 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407144 () Unit!18917)

(assert (=> b!266416 (= lt!407144 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266416 (= lt!407143 (BitStream!11761 (buf!6941 w2!580) (currentByte!12835 w1!584) (currentBit!12830 w1!584)))))

(declare-fun b!266417 () Bool)

(declare-fun Unit!18919 () Unit!18917)

(assert (=> b!266417 (= e!186353 Unit!18919)))

(declare-fun b!266418 () Bool)

(assert (=> b!266418 (= e!186354 e!186359)))

(declare-fun res!222549 () Bool)

(assert (=> b!266418 (=> res!222549 e!186359)))

(declare-fun e!186356 () Bool)

(assert (=> b!266418 (= res!222549 e!186356)))

(declare-fun res!222547 () Bool)

(assert (=> b!266418 (=> (not res!222547) (not e!186356))))

(assert (=> b!266418 (= res!222547 (not (= (size!6473 (buf!6941 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407145 () Unit!18917)

(assert (=> b!266418 (= lt!407145 e!186353)))

(declare-fun c!12258 () Bool)

(assert (=> b!266418 (= c!12258 (not (= (size!6473 (buf!6941 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266419 () Bool)

(assert (=> b!266419 (= e!186356 (not (arrayBitRangesEq!0 (buf!6941 w2!580) (buf!6941 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6473 (buf!6941 w1!584)) (currentByte!12835 w1!584) (currentBit!12830 w1!584)))))))

(declare-fun b!266420 () Bool)

(assert (=> b!266420 (= e!186351 (not (arrayBitRangesEq!0 (buf!6941 w1!584) (buf!6941 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6473 (buf!6941 w1!584)) (currentByte!12835 w1!584) (currentBit!12830 w1!584)))))))

(assert (= (and start!58034 res!222548) b!266416))

(assert (= (and b!266416 res!222550) b!266420))

(assert (= (and b!266416 (not res!222546)) b!266418))

(assert (= (and b!266418 c!12258) b!266414))

(assert (= (and b!266418 (not c!12258)) b!266417))

(assert (= (and b!266418 res!222547) b!266419))

(assert (= (and b!266418 (not res!222549)) b!266412))

(assert (= start!58034 b!266413))

(assert (= start!58034 b!266415))

(declare-fun m!397215 () Bool)

(assert (=> b!266419 m!397215))

(assert (=> b!266419 m!397215))

(declare-fun m!397217 () Bool)

(assert (=> b!266419 m!397217))

(declare-fun m!397219 () Bool)

(assert (=> b!266416 m!397219))

(declare-fun m!397221 () Bool)

(assert (=> b!266416 m!397221))

(declare-fun m!397223 () Bool)

(assert (=> b!266416 m!397223))

(declare-fun m!397225 () Bool)

(assert (=> b!266416 m!397225))

(declare-fun m!397227 () Bool)

(assert (=> b!266416 m!397227))

(declare-fun m!397229 () Bool)

(assert (=> b!266416 m!397229))

(assert (=> b!266420 m!397215))

(assert (=> b!266420 m!397215))

(declare-fun m!397231 () Bool)

(assert (=> b!266420 m!397231))

(declare-fun m!397233 () Bool)

(assert (=> b!266412 m!397233))

(declare-fun m!397235 () Bool)

(assert (=> b!266415 m!397235))

(declare-fun m!397237 () Bool)

(assert (=> start!58034 m!397237))

(declare-fun m!397239 () Bool)

(assert (=> start!58034 m!397239))

(declare-fun m!397241 () Bool)

(assert (=> start!58034 m!397241))

(declare-fun m!397243 () Bool)

(assert (=> b!266413 m!397243))

(assert (=> b!266414 m!397215))

(declare-fun m!397245 () Bool)

(assert (=> b!266414 m!397245))

(declare-fun m!397247 () Bool)

(assert (=> b!266414 m!397247))

(check-sat (not b!266413) (not b!266416) (not b!266415) (not b!266419) (not start!58034) (not b!266414) (not b!266412) (not b!266420))
(check-sat)
