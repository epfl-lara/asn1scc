; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58022 () Bool)

(assert start!58022)

(declare-fun e!186185 () Bool)

(declare-fun b!266258 () Bool)

(declare-fun lt!407011 () (_ BitVec 64))

(declare-datatypes ((array!14836 0))(
  ( (array!14837 (arr!7454 (Array (_ BitVec 32) (_ BitVec 8))) (size!6467 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11748 0))(
  ( (BitStream!11749 (buf!6935 array!14836) (currentByte!12829 (_ BitVec 32)) (currentBit!12824 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11748)

(declare-fun w1!584 () BitStream!11748)

(declare-fun arrayBitRangesEq!0 (array!14836 array!14836 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266258 (= e!186185 (arrayBitRangesEq!0 (buf!6935 w1!584) (buf!6935 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407011))))

(declare-fun b!266259 () Bool)

(declare-fun e!186180 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266259 (= e!186180 (not (arrayBitRangesEq!0 (buf!6935 w1!584) (buf!6935 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6467 (buf!6935 w1!584)) (currentByte!12829 w1!584) (currentBit!12824 w1!584)))))))

(declare-fun b!266260 () Bool)

(declare-fun e!186182 () Bool)

(assert (=> b!266260 (= e!186182 e!186185)))

(declare-fun res!222460 () Bool)

(assert (=> b!266260 (=> res!222460 e!186185)))

(assert (=> b!266260 (= res!222460 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!407011) (not (= (size!6467 (buf!6935 w1!584)) (size!6467 (buf!6935 w2!580)))) (bvsgt lt!407011 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6467 (buf!6935 w1!584)))))))))

(assert (=> b!266260 (= lt!407011 (bitIndex!0 (size!6467 (buf!6935 w1!584)) (currentByte!12829 w1!584) (currentBit!12824 w1!584)))))

(declare-fun b!266261 () Bool)

(declare-fun e!186183 () Bool)

(declare-fun array_inv!6191 (array!14836) Bool)

(assert (=> b!266261 (= e!186183 (array_inv!6191 (buf!6935 w1!584)))))

(declare-fun b!266262 () Bool)

(declare-fun e!186186 () Bool)

(assert (=> b!266262 (= e!186186 (not e!186182))))

(declare-fun res!222458 () Bool)

(assert (=> b!266262 (=> res!222458 e!186182)))

(assert (=> b!266262 (= res!222458 e!186180)))

(declare-fun res!222457 () Bool)

(assert (=> b!266262 (=> (not res!222457) (not e!186180))))

(assert (=> b!266262 (= res!222457 (not (= (size!6467 (buf!6935 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11748 BitStream!11748) Bool)

(assert (=> b!266262 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18901 0))(
  ( (Unit!18902) )
))
(declare-fun lt!407015 () Unit!18901)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11748) Unit!18901)

(assert (=> b!266262 (= lt!407015 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407012 () BitStream!11748)

(assert (=> b!266262 (isPrefixOf!0 lt!407012 lt!407012)))

(declare-fun lt!407013 () Unit!18901)

(assert (=> b!266262 (= lt!407013 (lemmaIsPrefixRefl!0 lt!407012))))

(assert (=> b!266262 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407014 () Unit!18901)

(assert (=> b!266262 (= lt!407014 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266262 (= lt!407012 (BitStream!11749 (buf!6935 w2!580) (currentByte!12829 w1!584) (currentBit!12824 w1!584)))))

(declare-fun b!266263 () Bool)

(declare-fun e!186181 () Bool)

(assert (=> b!266263 (= e!186181 (array_inv!6191 (buf!6935 w2!580)))))

(declare-fun b!266264 () Bool)

(declare-fun res!222459 () Bool)

(assert (=> b!266264 (=> res!222459 e!186182)))

(assert (=> b!266264 (= res!222459 (= (size!6467 (buf!6935 w1!584)) #b00000000000000000000000000000000))))

(declare-fun res!222456 () Bool)

(assert (=> start!58022 (=> (not res!222456) (not e!186186))))

(assert (=> start!58022 (= res!222456 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58022 e!186186))

(declare-fun inv!12 (BitStream!11748) Bool)

(assert (=> start!58022 (and (inv!12 w1!584) e!186183)))

(assert (=> start!58022 (and (inv!12 w2!580) e!186181)))

(assert (= (and start!58022 res!222456) b!266262))

(assert (= (and b!266262 res!222457) b!266259))

(assert (= (and b!266262 (not res!222458)) b!266264))

(assert (= (and b!266264 (not res!222459)) b!266260))

(assert (= (and b!266260 (not res!222460)) b!266258))

(assert (= start!58022 b!266261))

(assert (= start!58022 b!266263))

(declare-fun m!397023 () Bool)

(assert (=> b!266260 m!397023))

(declare-fun m!397025 () Bool)

(assert (=> b!266262 m!397025))

(declare-fun m!397027 () Bool)

(assert (=> b!266262 m!397027))

(declare-fun m!397029 () Bool)

(assert (=> b!266262 m!397029))

(declare-fun m!397031 () Bool)

(assert (=> b!266262 m!397031))

(declare-fun m!397033 () Bool)

(assert (=> b!266262 m!397033))

(declare-fun m!397035 () Bool)

(assert (=> b!266262 m!397035))

(declare-fun m!397037 () Bool)

(assert (=> b!266261 m!397037))

(declare-fun m!397039 () Bool)

(assert (=> start!58022 m!397039))

(declare-fun m!397041 () Bool)

(assert (=> start!58022 m!397041))

(declare-fun m!397043 () Bool)

(assert (=> start!58022 m!397043))

(assert (=> b!266259 m!397023))

(assert (=> b!266259 m!397023))

(declare-fun m!397045 () Bool)

(assert (=> b!266259 m!397045))

(declare-fun m!397047 () Bool)

(assert (=> b!266258 m!397047))

(declare-fun m!397049 () Bool)

(assert (=> b!266263 m!397049))

(check-sat (not b!266262) (not b!266260) (not b!266259) (not b!266258) (not b!266261) (not b!266263) (not start!58022))
(check-sat)
