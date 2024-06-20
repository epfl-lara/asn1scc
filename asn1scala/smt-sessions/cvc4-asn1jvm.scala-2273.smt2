; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57574 () Bool)

(assert start!57574)

(declare-fun b!263994 () Bool)

(declare-fun e!184170 () Bool)

(declare-fun e!184169 () Bool)

(assert (=> b!263994 (= e!184170 e!184169)))

(declare-fun res!220761 () Bool)

(assert (=> b!263994 (=> res!220761 e!184169)))

(declare-fun e!184173 () Bool)

(assert (=> b!263994 (= res!220761 e!184173)))

(declare-fun res!220762 () Bool)

(assert (=> b!263994 (=> (not res!220762) (not e!184173))))

(declare-datatypes ((array!14727 0))(
  ( (array!14728 (arr!7413 (Array (_ BitVec 32) (_ BitVec 8))) (size!6426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11666 0))(
  ( (BitStream!11667 (buf!6894 array!14727) (currentByte!12758 (_ BitVec 32)) (currentBit!12753 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11666)

(assert (=> b!263994 (= res!220762 (not (= (size!6426 (buf!6894 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18809 0))(
  ( (Unit!18810) )
))
(declare-fun lt!405367 () Unit!18809)

(declare-fun e!184175 () Unit!18809)

(assert (=> b!263994 (= lt!405367 e!184175)))

(declare-fun c!12084 () Bool)

(assert (=> b!263994 (= c!12084 (not (= (size!6426 (buf!6894 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263995 () Bool)

(declare-fun Unit!18811 () Unit!18809)

(assert (=> b!263995 (= e!184175 Unit!18811)))

(declare-fun b!263996 () Bool)

(declare-fun e!184171 () Bool)

(assert (=> b!263996 (= e!184171 (not e!184170))))

(declare-fun res!220764 () Bool)

(assert (=> b!263996 (=> res!220764 e!184170)))

(declare-fun e!184176 () Bool)

(assert (=> b!263996 (= res!220764 e!184176)))

(declare-fun res!220765 () Bool)

(assert (=> b!263996 (=> (not res!220765) (not e!184176))))

(assert (=> b!263996 (= res!220765 (not (= (size!6426 (buf!6894 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11666)

(declare-fun isPrefixOf!0 (BitStream!11666 BitStream!11666) Bool)

(assert (=> b!263996 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405368 () Unit!18809)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11666) Unit!18809)

(assert (=> b!263996 (= lt!405368 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405366 () BitStream!11666)

(assert (=> b!263996 (isPrefixOf!0 lt!405366 lt!405366)))

(declare-fun lt!405370 () Unit!18809)

(assert (=> b!263996 (= lt!405370 (lemmaIsPrefixRefl!0 lt!405366))))

(assert (=> b!263996 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405369 () Unit!18809)

(assert (=> b!263996 (= lt!405369 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263996 (= lt!405366 (BitStream!11667 (buf!6894 w2!580) (currentByte!12758 w1!584) (currentBit!12753 w1!584)))))

(declare-fun b!263997 () Bool)

(declare-fun e!184172 () Bool)

(declare-fun array_inv!6150 (array!14727) Bool)

(assert (=> b!263997 (= e!184172 (array_inv!6150 (buf!6894 w1!584)))))

(declare-fun b!263998 () Bool)

(declare-fun e!184174 () Bool)

(assert (=> b!263998 (= e!184174 (array_inv!6150 (buf!6894 w2!580)))))

(declare-fun b!263999 () Bool)

(assert (=> b!263999 (= e!184169 true)))

(declare-fun lt!405365 () Bool)

(assert (=> b!263999 (= lt!405365 (isPrefixOf!0 lt!405366 w1!584))))

(declare-fun b!264000 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14727 array!14727 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264000 (= e!184173 (not (arrayBitRangesEq!0 (buf!6894 w2!580) (buf!6894 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6426 (buf!6894 w1!584)) (currentByte!12758 w1!584) (currentBit!12753 w1!584)))))))

(declare-fun b!264001 () Bool)

(assert (=> b!264001 (= e!184176 (not (arrayBitRangesEq!0 (buf!6894 w1!584) (buf!6894 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6426 (buf!6894 w1!584)) (currentByte!12758 w1!584) (currentBit!12753 w1!584)))))))

(declare-fun res!220763 () Bool)

(assert (=> start!57574 (=> (not res!220763) (not e!184171))))

(assert (=> start!57574 (= res!220763 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57574 e!184171))

(declare-fun inv!12 (BitStream!11666) Bool)

(assert (=> start!57574 (and (inv!12 w1!584) e!184172)))

(assert (=> start!57574 (and (inv!12 w2!580) e!184174)))

(declare-fun b!264002 () Bool)

(declare-fun lt!405371 () Unit!18809)

(assert (=> b!264002 (= e!184175 lt!405371)))

(declare-fun lt!405364 () (_ BitVec 64))

(assert (=> b!264002 (= lt!405364 (bitIndex!0 (size!6426 (buf!6894 w1!584)) (currentByte!12758 w1!584) (currentBit!12753 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14727 array!14727 (_ BitVec 64) (_ BitVec 64)) Unit!18809)

(assert (=> b!264002 (= lt!405371 (arrayBitRangesEqSymmetric!0 (buf!6894 w1!584) (buf!6894 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405364))))

(assert (=> b!264002 (arrayBitRangesEq!0 (buf!6894 w2!580) (buf!6894 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405364)))

(assert (= (and start!57574 res!220763) b!263996))

(assert (= (and b!263996 res!220765) b!264001))

(assert (= (and b!263996 (not res!220764)) b!263994))

(assert (= (and b!263994 c!12084) b!264002))

(assert (= (and b!263994 (not c!12084)) b!263995))

(assert (= (and b!263994 res!220762) b!264000))

(assert (= (and b!263994 (not res!220761)) b!263999))

(assert (= start!57574 b!263997))

(assert (= start!57574 b!263998))

(declare-fun m!394375 () Bool)

(assert (=> b!264001 m!394375))

(assert (=> b!264001 m!394375))

(declare-fun m!394377 () Bool)

(assert (=> b!264001 m!394377))

(assert (=> b!264002 m!394375))

(declare-fun m!394379 () Bool)

(assert (=> b!264002 m!394379))

(declare-fun m!394381 () Bool)

(assert (=> b!264002 m!394381))

(declare-fun m!394383 () Bool)

(assert (=> b!263997 m!394383))

(declare-fun m!394385 () Bool)

(assert (=> b!263996 m!394385))

(declare-fun m!394387 () Bool)

(assert (=> b!263996 m!394387))

(declare-fun m!394389 () Bool)

(assert (=> b!263996 m!394389))

(declare-fun m!394391 () Bool)

(assert (=> b!263996 m!394391))

(declare-fun m!394393 () Bool)

(assert (=> b!263996 m!394393))

(declare-fun m!394395 () Bool)

(assert (=> b!263996 m!394395))

(declare-fun m!394397 () Bool)

(assert (=> b!263998 m!394397))

(declare-fun m!394399 () Bool)

(assert (=> b!263999 m!394399))

(declare-fun m!394401 () Bool)

(assert (=> start!57574 m!394401))

(declare-fun m!394403 () Bool)

(assert (=> start!57574 m!394403))

(declare-fun m!394405 () Bool)

(assert (=> start!57574 m!394405))

(assert (=> b!264000 m!394375))

(assert (=> b!264000 m!394375))

(declare-fun m!394407 () Bool)

(assert (=> b!264000 m!394407))

(push 1)

