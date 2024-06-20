; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58028 () Bool)

(assert start!58028)

(declare-fun b!266331 () Bool)

(declare-datatypes ((Unit!18908 0))(
  ( (Unit!18909) )
))
(declare-fun e!186261 () Unit!18908)

(declare-fun lt!407072 () Unit!18908)

(assert (=> b!266331 (= e!186261 lt!407072)))

(declare-fun lt!407073 () (_ BitVec 64))

(declare-datatypes ((array!14842 0))(
  ( (array!14843 (arr!7457 (Array (_ BitVec 32) (_ BitVec 8))) (size!6470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11754 0))(
  ( (BitStream!11755 (buf!6938 array!14842) (currentByte!12832 (_ BitVec 32)) (currentBit!12827 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11754)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266331 (= lt!407073 (bitIndex!0 (size!6470 (buf!6938 w1!584)) (currentByte!12832 w1!584) (currentBit!12827 w1!584)))))

(declare-fun w2!580 () BitStream!11754)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14842 array!14842 (_ BitVec 64) (_ BitVec 64)) Unit!18908)

(assert (=> b!266331 (= lt!407072 (arrayBitRangesEqSymmetric!0 (buf!6938 w1!584) (buf!6938 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407073))))

(declare-fun arrayBitRangesEq!0 (array!14842 array!14842 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266331 (arrayBitRangesEq!0 (buf!6938 w2!580) (buf!6938 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407073)))

(declare-fun b!266332 () Bool)

(declare-fun e!186265 () Bool)

(declare-fun array_inv!6194 (array!14842) Bool)

(assert (=> b!266332 (= e!186265 (array_inv!6194 (buf!6938 w1!584)))))

(declare-fun b!266333 () Bool)

(declare-fun e!186262 () Bool)

(declare-fun e!186267 () Bool)

(assert (=> b!266333 (= e!186262 (not e!186267))))

(declare-fun res!222504 () Bool)

(assert (=> b!266333 (=> res!222504 e!186267)))

(declare-fun e!186266 () Bool)

(assert (=> b!266333 (= res!222504 e!186266)))

(declare-fun res!222505 () Bool)

(assert (=> b!266333 (=> (not res!222505) (not e!186266))))

(assert (=> b!266333 (= res!222505 (not (= (size!6470 (buf!6938 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11754 BitStream!11754) Bool)

(assert (=> b!266333 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407074 () Unit!18908)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11754) Unit!18908)

(assert (=> b!266333 (= lt!407074 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407077 () BitStream!11754)

(assert (=> b!266333 (isPrefixOf!0 lt!407077 lt!407077)))

(declare-fun lt!407078 () Unit!18908)

(assert (=> b!266333 (= lt!407078 (lemmaIsPrefixRefl!0 lt!407077))))

(assert (=> b!266333 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407075 () Unit!18908)

(assert (=> b!266333 (= lt!407075 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266333 (= lt!407077 (BitStream!11755 (buf!6938 w2!580) (currentByte!12832 w1!584) (currentBit!12827 w1!584)))))

(declare-fun b!266334 () Bool)

(declare-fun Unit!18910 () Unit!18908)

(assert (=> b!266334 (= e!186261 Unit!18910)))

(declare-fun b!266335 () Bool)

(declare-fun e!186263 () Bool)

(assert (=> b!266335 (= e!186263 true)))

(declare-fun lt!407071 () Bool)

(assert (=> b!266335 (= lt!407071 (isPrefixOf!0 lt!407077 w1!584))))

(declare-fun res!222502 () Bool)

(assert (=> start!58028 (=> (not res!222502) (not e!186262))))

(assert (=> start!58028 (= res!222502 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58028 e!186262))

(declare-fun inv!12 (BitStream!11754) Bool)

(assert (=> start!58028 (and (inv!12 w1!584) e!186265)))

(declare-fun e!186264 () Bool)

(assert (=> start!58028 (and (inv!12 w2!580) e!186264)))

(declare-fun b!266336 () Bool)

(assert (=> b!266336 (= e!186267 e!186263)))

(declare-fun res!222503 () Bool)

(assert (=> b!266336 (=> res!222503 e!186263)))

(declare-fun e!186268 () Bool)

(assert (=> b!266336 (= res!222503 e!186268)))

(declare-fun res!222501 () Bool)

(assert (=> b!266336 (=> (not res!222501) (not e!186268))))

(assert (=> b!266336 (= res!222501 (not (= (size!6470 (buf!6938 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407076 () Unit!18908)

(assert (=> b!266336 (= lt!407076 e!186261)))

(declare-fun c!12249 () Bool)

(assert (=> b!266336 (= c!12249 (not (= (size!6470 (buf!6938 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266337 () Bool)

(assert (=> b!266337 (= e!186264 (array_inv!6194 (buf!6938 w2!580)))))

(declare-fun b!266338 () Bool)

(assert (=> b!266338 (= e!186268 (not (arrayBitRangesEq!0 (buf!6938 w2!580) (buf!6938 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6470 (buf!6938 w1!584)) (currentByte!12832 w1!584) (currentBit!12827 w1!584)))))))

(declare-fun b!266339 () Bool)

(assert (=> b!266339 (= e!186266 (not (arrayBitRangesEq!0 (buf!6938 w1!584) (buf!6938 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6470 (buf!6938 w1!584)) (currentByte!12832 w1!584) (currentBit!12827 w1!584)))))))

(assert (= (and start!58028 res!222502) b!266333))

(assert (= (and b!266333 res!222505) b!266339))

(assert (= (and b!266333 (not res!222504)) b!266336))

(assert (= (and b!266336 c!12249) b!266331))

(assert (= (and b!266336 (not c!12249)) b!266334))

(assert (= (and b!266336 res!222501) b!266338))

(assert (= (and b!266336 (not res!222503)) b!266335))

(assert (= start!58028 b!266332))

(assert (= start!58028 b!266337))

(declare-fun m!397113 () Bool)

(assert (=> b!266335 m!397113))

(declare-fun m!397115 () Bool)

(assert (=> b!266333 m!397115))

(declare-fun m!397117 () Bool)

(assert (=> b!266333 m!397117))

(declare-fun m!397119 () Bool)

(assert (=> b!266333 m!397119))

(declare-fun m!397121 () Bool)

(assert (=> b!266333 m!397121))

(declare-fun m!397123 () Bool)

(assert (=> b!266333 m!397123))

(declare-fun m!397125 () Bool)

(assert (=> b!266333 m!397125))

(declare-fun m!397127 () Bool)

(assert (=> b!266338 m!397127))

(assert (=> b!266338 m!397127))

(declare-fun m!397129 () Bool)

(assert (=> b!266338 m!397129))

(assert (=> b!266339 m!397127))

(assert (=> b!266339 m!397127))

(declare-fun m!397131 () Bool)

(assert (=> b!266339 m!397131))

(declare-fun m!397133 () Bool)

(assert (=> b!266337 m!397133))

(declare-fun m!397135 () Bool)

(assert (=> b!266332 m!397135))

(declare-fun m!397137 () Bool)

(assert (=> start!58028 m!397137))

(declare-fun m!397139 () Bool)

(assert (=> start!58028 m!397139))

(declare-fun m!397141 () Bool)

(assert (=> start!58028 m!397141))

(assert (=> b!266331 m!397127))

(declare-fun m!397143 () Bool)

(assert (=> b!266331 m!397143))

(declare-fun m!397145 () Bool)

(assert (=> b!266331 m!397145))

(check-sat (not b!266333) (not b!266331) (not b!266335) (not b!266332) (not start!58028) (not b!266339) (not b!266337) (not b!266338))
(check-sat)
