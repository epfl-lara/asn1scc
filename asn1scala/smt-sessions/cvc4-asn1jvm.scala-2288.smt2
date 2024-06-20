; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58030 () Bool)

(assert start!58030)

(declare-fun res!222518 () Bool)

(declare-fun e!186296 () Bool)

(assert (=> start!58030 (=> (not res!222518) (not e!186296))))

(declare-datatypes ((array!14844 0))(
  ( (array!14845 (arr!7458 (Array (_ BitVec 32) (_ BitVec 8))) (size!6471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11756 0))(
  ( (BitStream!11757 (buf!6939 array!14844) (currentByte!12833 (_ BitVec 32)) (currentBit!12828 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11756)

(declare-fun w2!580 () BitStream!11756)

(declare-fun isPrefixOf!0 (BitStream!11756 BitStream!11756) Bool)

(assert (=> start!58030 (= res!222518 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58030 e!186296))

(declare-fun e!186294 () Bool)

(declare-fun inv!12 (BitStream!11756) Bool)

(assert (=> start!58030 (and (inv!12 w1!584) e!186294)))

(declare-fun e!186297 () Bool)

(assert (=> start!58030 (and (inv!12 w2!580) e!186297)))

(declare-fun b!266358 () Bool)

(declare-fun e!186300 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14844 array!14844 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266358 (= e!186300 (not (arrayBitRangesEq!0 (buf!6939 w2!580) (buf!6939 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6471 (buf!6939 w1!584)) (currentByte!12833 w1!584) (currentBit!12828 w1!584)))))))

(declare-fun b!266359 () Bool)

(declare-datatypes ((Unit!18911 0))(
  ( (Unit!18912) )
))
(declare-fun e!186293 () Unit!18911)

(declare-fun Unit!18913 () Unit!18911)

(assert (=> b!266359 (= e!186293 Unit!18913)))

(declare-fun b!266360 () Bool)

(declare-fun lt!407102 () Unit!18911)

(assert (=> b!266360 (= e!186293 lt!407102)))

(declare-fun lt!407099 () (_ BitVec 64))

(assert (=> b!266360 (= lt!407099 (bitIndex!0 (size!6471 (buf!6939 w1!584)) (currentByte!12833 w1!584) (currentBit!12828 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14844 array!14844 (_ BitVec 64) (_ BitVec 64)) Unit!18911)

(assert (=> b!266360 (= lt!407102 (arrayBitRangesEqSymmetric!0 (buf!6939 w1!584) (buf!6939 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407099))))

(assert (=> b!266360 (arrayBitRangesEq!0 (buf!6939 w2!580) (buf!6939 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407099)))

(declare-fun b!266361 () Bool)

(declare-fun e!186292 () Bool)

(declare-fun e!186298 () Bool)

(assert (=> b!266361 (= e!186292 e!186298)))

(declare-fun res!222516 () Bool)

(assert (=> b!266361 (=> res!222516 e!186298)))

(assert (=> b!266361 (= res!222516 e!186300)))

(declare-fun res!222519 () Bool)

(assert (=> b!266361 (=> (not res!222519) (not e!186300))))

(assert (=> b!266361 (= res!222519 (not (= (size!6471 (buf!6939 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407095 () Unit!18911)

(assert (=> b!266361 (= lt!407095 e!186293)))

(declare-fun c!12252 () Bool)

(assert (=> b!266361 (= c!12252 (not (= (size!6471 (buf!6939 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266362 () Bool)

(assert (=> b!266362 (= e!186298 true)))

(declare-fun lt!407101 () Bool)

(declare-fun lt!407098 () BitStream!11756)

(assert (=> b!266362 (= lt!407101 (isPrefixOf!0 lt!407098 w1!584))))

(declare-fun b!266363 () Bool)

(declare-fun array_inv!6195 (array!14844) Bool)

(assert (=> b!266363 (= e!186297 (array_inv!6195 (buf!6939 w2!580)))))

(declare-fun b!266364 () Bool)

(assert (=> b!266364 (= e!186294 (array_inv!6195 (buf!6939 w1!584)))))

(declare-fun b!266365 () Bool)

(declare-fun e!186291 () Bool)

(assert (=> b!266365 (= e!186291 (not (arrayBitRangesEq!0 (buf!6939 w1!584) (buf!6939 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6471 (buf!6939 w1!584)) (currentByte!12833 w1!584) (currentBit!12828 w1!584)))))))

(declare-fun b!266366 () Bool)

(assert (=> b!266366 (= e!186296 (not e!186292))))

(declare-fun res!222520 () Bool)

(assert (=> b!266366 (=> res!222520 e!186292)))

(assert (=> b!266366 (= res!222520 e!186291)))

(declare-fun res!222517 () Bool)

(assert (=> b!266366 (=> (not res!222517) (not e!186291))))

(assert (=> b!266366 (= res!222517 (not (= (size!6471 (buf!6939 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266366 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407097 () Unit!18911)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11756) Unit!18911)

(assert (=> b!266366 (= lt!407097 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266366 (isPrefixOf!0 lt!407098 lt!407098)))

(declare-fun lt!407100 () Unit!18911)

(assert (=> b!266366 (= lt!407100 (lemmaIsPrefixRefl!0 lt!407098))))

(assert (=> b!266366 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407096 () Unit!18911)

(assert (=> b!266366 (= lt!407096 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266366 (= lt!407098 (BitStream!11757 (buf!6939 w2!580) (currentByte!12833 w1!584) (currentBit!12828 w1!584)))))

(assert (= (and start!58030 res!222518) b!266366))

(assert (= (and b!266366 res!222517) b!266365))

(assert (= (and b!266366 (not res!222520)) b!266361))

(assert (= (and b!266361 c!12252) b!266360))

(assert (= (and b!266361 (not c!12252)) b!266359))

(assert (= (and b!266361 res!222519) b!266358))

(assert (= (and b!266361 (not res!222516)) b!266362))

(assert (= start!58030 b!266364))

(assert (= start!58030 b!266363))

(declare-fun m!397147 () Bool)

(assert (=> b!266358 m!397147))

(assert (=> b!266358 m!397147))

(declare-fun m!397149 () Bool)

(assert (=> b!266358 m!397149))

(assert (=> b!266360 m!397147))

(declare-fun m!397151 () Bool)

(assert (=> b!266360 m!397151))

(declare-fun m!397153 () Bool)

(assert (=> b!266360 m!397153))

(declare-fun m!397155 () Bool)

(assert (=> b!266364 m!397155))

(declare-fun m!397157 () Bool)

(assert (=> start!58030 m!397157))

(declare-fun m!397159 () Bool)

(assert (=> start!58030 m!397159))

(declare-fun m!397161 () Bool)

(assert (=> start!58030 m!397161))

(declare-fun m!397163 () Bool)

(assert (=> b!266366 m!397163))

(declare-fun m!397165 () Bool)

(assert (=> b!266366 m!397165))

(declare-fun m!397167 () Bool)

(assert (=> b!266366 m!397167))

(declare-fun m!397169 () Bool)

(assert (=> b!266366 m!397169))

(declare-fun m!397171 () Bool)

(assert (=> b!266366 m!397171))

(declare-fun m!397173 () Bool)

(assert (=> b!266366 m!397173))

(declare-fun m!397175 () Bool)

(assert (=> b!266362 m!397175))

(assert (=> b!266365 m!397147))

(assert (=> b!266365 m!397147))

(declare-fun m!397177 () Bool)

(assert (=> b!266365 m!397177))

(declare-fun m!397179 () Bool)

(assert (=> b!266363 m!397179))

(push 1)

(assert (not b!266364))

(assert (not b!266360))

(assert (not b!266362))

(assert (not b!266358))

(assert (not b!266366))

(assert (not b!266365))

(assert (not start!58030))

(assert (not b!266363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

