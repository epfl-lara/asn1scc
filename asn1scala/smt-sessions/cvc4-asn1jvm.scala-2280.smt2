; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57814 () Bool)

(assert start!57814)

(declare-fun b!265291 () Bool)

(declare-fun e!185308 () Bool)

(declare-datatypes ((array!14781 0))(
  ( (array!14782 (arr!7434 (Array (_ BitVec 32) (_ BitVec 8))) (size!6447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11708 0))(
  ( (BitStream!11709 (buf!6915 array!14781) (currentByte!12797 (_ BitVec 32)) (currentBit!12792 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11708)

(declare-fun array_inv!6171 (array!14781) Bool)

(assert (=> b!265291 (= e!185308 (array_inv!6171 (buf!6915 w2!580)))))

(declare-fun b!265292 () Bool)

(declare-fun e!185305 () Bool)

(declare-fun w1!584 () BitStream!11708)

(declare-fun arrayBitRangesEq!0 (array!14781 array!14781 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265292 (= e!185305 (arrayBitRangesEq!0 (buf!6915 w2!580) (buf!6915 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6447 (buf!6915 w1!584)) (currentByte!12797 w1!584) (currentBit!12792 w1!584))))))

(declare-fun res!221713 () Bool)

(declare-fun e!185310 () Bool)

(assert (=> start!57814 (=> (not res!221713) (not e!185310))))

(declare-fun isPrefixOf!0 (BitStream!11708 BitStream!11708) Bool)

(assert (=> start!57814 (= res!221713 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57814 e!185310))

(declare-fun e!185307 () Bool)

(declare-fun inv!12 (BitStream!11708) Bool)

(assert (=> start!57814 (and (inv!12 w1!584) e!185307)))

(assert (=> start!57814 (and (inv!12 w2!580) e!185308)))

(declare-fun b!265293 () Bool)

(declare-fun e!185311 () Bool)

(assert (=> b!265293 (= e!185311 e!185305)))

(declare-fun res!221714 () Bool)

(assert (=> b!265293 (=> res!221714 e!185305)))

(assert (=> b!265293 (= res!221714 (= (size!6447 (buf!6915 w1!584)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18869 0))(
  ( (Unit!18870) )
))
(declare-fun lt!406394 () Unit!18869)

(declare-fun e!185306 () Unit!18869)

(assert (=> b!265293 (= lt!406394 e!185306)))

(declare-fun c!12192 () Bool)

(assert (=> b!265293 (= c!12192 (not (= (size!6447 (buf!6915 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!265294 () Bool)

(declare-fun e!185309 () Bool)

(assert (=> b!265294 (= e!185309 (not (arrayBitRangesEq!0 (buf!6915 w1!584) (buf!6915 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6447 (buf!6915 w1!584)) (currentByte!12797 w1!584) (currentBit!12792 w1!584)))))))

(declare-fun b!265295 () Bool)

(declare-fun Unit!18871 () Unit!18869)

(assert (=> b!265295 (= e!185306 Unit!18871)))

(declare-fun b!265296 () Bool)

(declare-fun lt!406389 () Unit!18869)

(assert (=> b!265296 (= e!185306 lt!406389)))

(declare-fun lt!406393 () (_ BitVec 64))

(assert (=> b!265296 (= lt!406393 (bitIndex!0 (size!6447 (buf!6915 w1!584)) (currentByte!12797 w1!584) (currentBit!12792 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14781 array!14781 (_ BitVec 64) (_ BitVec 64)) Unit!18869)

(assert (=> b!265296 (= lt!406389 (arrayBitRangesEqSymmetric!0 (buf!6915 w1!584) (buf!6915 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406393))))

(assert (=> b!265296 (arrayBitRangesEq!0 (buf!6915 w2!580) (buf!6915 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406393)))

(declare-fun b!265297 () Bool)

(assert (=> b!265297 (= e!185307 (array_inv!6171 (buf!6915 w1!584)))))

(declare-fun b!265298 () Bool)

(assert (=> b!265298 (= e!185310 (not e!185311))))

(declare-fun res!221716 () Bool)

(assert (=> b!265298 (=> res!221716 e!185311)))

(assert (=> b!265298 (= res!221716 e!185309)))

(declare-fun res!221715 () Bool)

(assert (=> b!265298 (=> (not res!221715) (not e!185309))))

(assert (=> b!265298 (= res!221715 (not (= (size!6447 (buf!6915 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265298 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406390 () Unit!18869)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11708) Unit!18869)

(assert (=> b!265298 (= lt!406390 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406391 () BitStream!11708)

(assert (=> b!265298 (isPrefixOf!0 lt!406391 lt!406391)))

(declare-fun lt!406392 () Unit!18869)

(assert (=> b!265298 (= lt!406392 (lemmaIsPrefixRefl!0 lt!406391))))

(assert (=> b!265298 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406388 () Unit!18869)

(assert (=> b!265298 (= lt!406388 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265298 (= lt!406391 (BitStream!11709 (buf!6915 w2!580) (currentByte!12797 w1!584) (currentBit!12792 w1!584)))))

(assert (= (and start!57814 res!221713) b!265298))

(assert (= (and b!265298 res!221715) b!265294))

(assert (= (and b!265298 (not res!221716)) b!265293))

(assert (= (and b!265293 c!12192) b!265296))

(assert (= (and b!265293 (not c!12192)) b!265295))

(assert (= (and b!265293 (not res!221714)) b!265292))

(assert (= start!57814 b!265297))

(assert (= start!57814 b!265291))

(declare-fun m!395967 () Bool)

(assert (=> b!265294 m!395967))

(assert (=> b!265294 m!395967))

(declare-fun m!395969 () Bool)

(assert (=> b!265294 m!395969))

(declare-fun m!395971 () Bool)

(assert (=> start!57814 m!395971))

(declare-fun m!395973 () Bool)

(assert (=> start!57814 m!395973))

(declare-fun m!395975 () Bool)

(assert (=> start!57814 m!395975))

(declare-fun m!395977 () Bool)

(assert (=> b!265291 m!395977))

(declare-fun m!395979 () Bool)

(assert (=> b!265298 m!395979))

(declare-fun m!395981 () Bool)

(assert (=> b!265298 m!395981))

(declare-fun m!395983 () Bool)

(assert (=> b!265298 m!395983))

(declare-fun m!395985 () Bool)

(assert (=> b!265298 m!395985))

(declare-fun m!395987 () Bool)

(assert (=> b!265298 m!395987))

(declare-fun m!395989 () Bool)

(assert (=> b!265298 m!395989))

(declare-fun m!395991 () Bool)

(assert (=> b!265297 m!395991))

(assert (=> b!265292 m!395967))

(assert (=> b!265292 m!395967))

(declare-fun m!395993 () Bool)

(assert (=> b!265292 m!395993))

(assert (=> b!265296 m!395967))

(declare-fun m!395995 () Bool)

(assert (=> b!265296 m!395995))

(declare-fun m!395997 () Bool)

(assert (=> b!265296 m!395997))

(push 1)

(assert (not b!265294))

(assert (not b!265291))

(assert (not b!265292))

