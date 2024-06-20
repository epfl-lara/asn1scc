; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57572 () Bool)

(assert start!57572)

(declare-fun b!263967 () Bool)

(declare-fun e!184142 () Bool)

(declare-datatypes ((array!14725 0))(
  ( (array!14726 (arr!7412 (Array (_ BitVec 32) (_ BitVec 8))) (size!6425 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11664 0))(
  ( (BitStream!11665 (buf!6893 array!14725) (currentByte!12757 (_ BitVec 32)) (currentBit!12752 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11664)

(declare-fun w1!584 () BitStream!11664)

(declare-fun arrayBitRangesEq!0 (array!14725 array!14725 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263967 (= e!184142 (not (arrayBitRangesEq!0 (buf!6893 w2!580) (buf!6893 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6425 (buf!6893 w1!584)) (currentByte!12757 w1!584) (currentBit!12752 w1!584)))))))

(declare-fun b!263968 () Bool)

(declare-datatypes ((Unit!18806 0))(
  ( (Unit!18807) )
))
(declare-fun e!184141 () Unit!18806)

(declare-fun lt!405340 () Unit!18806)

(assert (=> b!263968 (= e!184141 lt!405340)))

(declare-fun lt!405342 () (_ BitVec 64))

(assert (=> b!263968 (= lt!405342 (bitIndex!0 (size!6425 (buf!6893 w1!584)) (currentByte!12757 w1!584) (currentBit!12752 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14725 array!14725 (_ BitVec 64) (_ BitVec 64)) Unit!18806)

(assert (=> b!263968 (= lt!405340 (arrayBitRangesEqSymmetric!0 (buf!6893 w1!584) (buf!6893 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405342))))

(assert (=> b!263968 (arrayBitRangesEq!0 (buf!6893 w2!580) (buf!6893 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405342)))

(declare-fun b!263969 () Bool)

(declare-fun e!184139 () Bool)

(declare-fun array_inv!6149 (array!14725) Bool)

(assert (=> b!263969 (= e!184139 (array_inv!6149 (buf!6893 w2!580)))))

(declare-fun b!263970 () Bool)

(declare-fun Unit!18808 () Unit!18806)

(assert (=> b!263970 (= e!184141 Unit!18808)))

(declare-fun b!263971 () Bool)

(declare-fun e!184144 () Bool)

(assert (=> b!263971 (= e!184144 (array_inv!6149 (buf!6893 w1!584)))))

(declare-fun b!263973 () Bool)

(declare-fun e!184146 () Bool)

(declare-fun e!184145 () Bool)

(assert (=> b!263973 (= e!184146 e!184145)))

(declare-fun res!220746 () Bool)

(assert (=> b!263973 (=> res!220746 e!184145)))

(assert (=> b!263973 (= res!220746 e!184142)))

(declare-fun res!220749 () Bool)

(assert (=> b!263973 (=> (not res!220749) (not e!184142))))

(assert (=> b!263973 (= res!220749 (not (= (size!6425 (buf!6893 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405343 () Unit!18806)

(assert (=> b!263973 (= lt!405343 e!184141)))

(declare-fun c!12081 () Bool)

(assert (=> b!263973 (= c!12081 (not (= (size!6425 (buf!6893 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263974 () Bool)

(declare-fun e!184143 () Bool)

(assert (=> b!263974 (= e!184143 (not (arrayBitRangesEq!0 (buf!6893 w1!584) (buf!6893 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6425 (buf!6893 w1!584)) (currentByte!12757 w1!584) (currentBit!12752 w1!584)))))))

(declare-fun b!263975 () Bool)

(assert (=> b!263975 (= e!184145 true)))

(declare-fun lt!405341 () Bool)

(declare-fun lt!405345 () BitStream!11664)

(declare-fun isPrefixOf!0 (BitStream!11664 BitStream!11664) Bool)

(assert (=> b!263975 (= lt!405341 (isPrefixOf!0 lt!405345 w1!584))))

(declare-fun res!220748 () Bool)

(declare-fun e!184140 () Bool)

(assert (=> start!57572 (=> (not res!220748) (not e!184140))))

(assert (=> start!57572 (= res!220748 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57572 e!184140))

(declare-fun inv!12 (BitStream!11664) Bool)

(assert (=> start!57572 (and (inv!12 w1!584) e!184144)))

(assert (=> start!57572 (and (inv!12 w2!580) e!184139)))

(declare-fun b!263972 () Bool)

(assert (=> b!263972 (= e!184140 (not e!184146))))

(declare-fun res!220747 () Bool)

(assert (=> b!263972 (=> res!220747 e!184146)))

(assert (=> b!263972 (= res!220747 e!184143)))

(declare-fun res!220750 () Bool)

(assert (=> b!263972 (=> (not res!220750) (not e!184143))))

(assert (=> b!263972 (= res!220750 (not (= (size!6425 (buf!6893 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263972 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405344 () Unit!18806)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11664) Unit!18806)

(assert (=> b!263972 (= lt!405344 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!263972 (isPrefixOf!0 lt!405345 lt!405345)))

(declare-fun lt!405346 () Unit!18806)

(assert (=> b!263972 (= lt!405346 (lemmaIsPrefixRefl!0 lt!405345))))

(assert (=> b!263972 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405347 () Unit!18806)

(assert (=> b!263972 (= lt!405347 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263972 (= lt!405345 (BitStream!11665 (buf!6893 w2!580) (currentByte!12757 w1!584) (currentBit!12752 w1!584)))))

(assert (= (and start!57572 res!220748) b!263972))

(assert (= (and b!263972 res!220750) b!263974))

(assert (= (and b!263972 (not res!220747)) b!263973))

(assert (= (and b!263973 c!12081) b!263968))

(assert (= (and b!263973 (not c!12081)) b!263970))

(assert (= (and b!263973 res!220749) b!263967))

(assert (= (and b!263973 (not res!220746)) b!263975))

(assert (= start!57572 b!263971))

(assert (= start!57572 b!263969))

(declare-fun m!394341 () Bool)

(assert (=> b!263972 m!394341))

(declare-fun m!394343 () Bool)

(assert (=> b!263972 m!394343))

(declare-fun m!394345 () Bool)

(assert (=> b!263972 m!394345))

(declare-fun m!394347 () Bool)

(assert (=> b!263972 m!394347))

(declare-fun m!394349 () Bool)

(assert (=> b!263972 m!394349))

(declare-fun m!394351 () Bool)

(assert (=> b!263972 m!394351))

(declare-fun m!394353 () Bool)

(assert (=> b!263969 m!394353))

(declare-fun m!394355 () Bool)

(assert (=> b!263974 m!394355))

(assert (=> b!263974 m!394355))

(declare-fun m!394357 () Bool)

(assert (=> b!263974 m!394357))

(assert (=> b!263968 m!394355))

(declare-fun m!394359 () Bool)

(assert (=> b!263968 m!394359))

(declare-fun m!394361 () Bool)

(assert (=> b!263968 m!394361))

(assert (=> b!263967 m!394355))

(assert (=> b!263967 m!394355))

(declare-fun m!394363 () Bool)

(assert (=> b!263967 m!394363))

(declare-fun m!394365 () Bool)

(assert (=> b!263971 m!394365))

(declare-fun m!394367 () Bool)

(assert (=> start!57572 m!394367))

(declare-fun m!394369 () Bool)

(assert (=> start!57572 m!394369))

(declare-fun m!394371 () Bool)

(assert (=> start!57572 m!394371))

(declare-fun m!394373 () Bool)

(assert (=> b!263975 m!394373))

(check-sat (not b!263974) (not b!263969) (not b!263967) (not start!57572) (not b!263971) (not b!263975) (not b!263968) (not b!263972))
(check-sat)
