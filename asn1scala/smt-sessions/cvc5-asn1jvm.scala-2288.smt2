; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58026 () Bool)

(assert start!58026)

(declare-fun b!266304 () Bool)

(declare-fun e!186236 () Bool)

(declare-datatypes ((array!14840 0))(
  ( (array!14841 (arr!7456 (Array (_ BitVec 32) (_ BitVec 8))) (size!6469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11752 0))(
  ( (BitStream!11753 (buf!6937 array!14840) (currentByte!12831 (_ BitVec 32)) (currentBit!12826 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11752)

(declare-fun w2!580 () BitStream!11752)

(declare-fun arrayBitRangesEq!0 (array!14840 array!14840 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266304 (= e!186236 (not (arrayBitRangesEq!0 (buf!6937 w1!584) (buf!6937 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6469 (buf!6937 w1!584)) (currentByte!12831 w1!584) (currentBit!12826 w1!584)))))))

(declare-fun b!266305 () Bool)

(declare-fun e!186235 () Bool)

(declare-fun e!186237 () Bool)

(assert (=> b!266305 (= e!186235 e!186237)))

(declare-fun res!222490 () Bool)

(assert (=> b!266305 (=> res!222490 e!186237)))

(declare-fun e!186234 () Bool)

(assert (=> b!266305 (= res!222490 e!186234)))

(declare-fun res!222487 () Bool)

(assert (=> b!266305 (=> (not res!222487) (not e!186234))))

(assert (=> b!266305 (= res!222487 (not (= (size!6469 (buf!6937 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18905 0))(
  ( (Unit!18906) )
))
(declare-fun lt!407054 () Unit!18905)

(declare-fun e!186232 () Unit!18905)

(assert (=> b!266305 (= lt!407054 e!186232)))

(declare-fun c!12246 () Bool)

(assert (=> b!266305 (= c!12246 (not (= (size!6469 (buf!6937 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266306 () Bool)

(declare-fun e!186238 () Bool)

(declare-fun array_inv!6193 (array!14840) Bool)

(assert (=> b!266306 (= e!186238 (array_inv!6193 (buf!6937 w2!580)))))

(declare-fun b!266307 () Bool)

(declare-fun Unit!18907 () Unit!18905)

(assert (=> b!266307 (= e!186232 Unit!18907)))

(declare-fun b!266308 () Bool)

(declare-fun e!186231 () Bool)

(assert (=> b!266308 (= e!186231 (not e!186235))))

(declare-fun res!222488 () Bool)

(assert (=> b!266308 (=> res!222488 e!186235)))

(assert (=> b!266308 (= res!222488 e!186236)))

(declare-fun res!222486 () Bool)

(assert (=> b!266308 (=> (not res!222486) (not e!186236))))

(assert (=> b!266308 (= res!222486 (not (= (size!6469 (buf!6937 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11752 BitStream!11752) Bool)

(assert (=> b!266308 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407053 () Unit!18905)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11752) Unit!18905)

(assert (=> b!266308 (= lt!407053 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407047 () BitStream!11752)

(assert (=> b!266308 (isPrefixOf!0 lt!407047 lt!407047)))

(declare-fun lt!407049 () Unit!18905)

(assert (=> b!266308 (= lt!407049 (lemmaIsPrefixRefl!0 lt!407047))))

(assert (=> b!266308 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407051 () Unit!18905)

(assert (=> b!266308 (= lt!407051 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266308 (= lt!407047 (BitStream!11753 (buf!6937 w2!580) (currentByte!12831 w1!584) (currentBit!12826 w1!584)))))

(declare-fun b!266309 () Bool)

(assert (=> b!266309 (= e!186234 (not (arrayBitRangesEq!0 (buf!6937 w2!580) (buf!6937 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6469 (buf!6937 w1!584)) (currentByte!12831 w1!584) (currentBit!12826 w1!584)))))))

(declare-fun b!266310 () Bool)

(declare-fun lt!407048 () Unit!18905)

(assert (=> b!266310 (= e!186232 lt!407048)))

(declare-fun lt!407052 () (_ BitVec 64))

(assert (=> b!266310 (= lt!407052 (bitIndex!0 (size!6469 (buf!6937 w1!584)) (currentByte!12831 w1!584) (currentBit!12826 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14840 array!14840 (_ BitVec 64) (_ BitVec 64)) Unit!18905)

(assert (=> b!266310 (= lt!407048 (arrayBitRangesEqSymmetric!0 (buf!6937 w1!584) (buf!6937 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407052))))

(assert (=> b!266310 (arrayBitRangesEq!0 (buf!6937 w2!580) (buf!6937 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407052)))

(declare-fun b!266311 () Bool)

(assert (=> b!266311 (= e!186237 true)))

(declare-fun lt!407050 () Bool)

(assert (=> b!266311 (= lt!407050 (isPrefixOf!0 lt!407047 w1!584))))

(declare-fun b!266312 () Bool)

(declare-fun e!186240 () Bool)

(assert (=> b!266312 (= e!186240 (array_inv!6193 (buf!6937 w1!584)))))

(declare-fun res!222489 () Bool)

(assert (=> start!58026 (=> (not res!222489) (not e!186231))))

(assert (=> start!58026 (= res!222489 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58026 e!186231))

(declare-fun inv!12 (BitStream!11752) Bool)

(assert (=> start!58026 (and (inv!12 w1!584) e!186240)))

(assert (=> start!58026 (and (inv!12 w2!580) e!186238)))

(assert (= (and start!58026 res!222489) b!266308))

(assert (= (and b!266308 res!222486) b!266304))

(assert (= (and b!266308 (not res!222488)) b!266305))

(assert (= (and b!266305 c!12246) b!266310))

(assert (= (and b!266305 (not c!12246)) b!266307))

(assert (= (and b!266305 res!222487) b!266309))

(assert (= (and b!266305 (not res!222490)) b!266311))

(assert (= start!58026 b!266312))

(assert (= start!58026 b!266306))

(declare-fun m!397079 () Bool)

(assert (=> b!266306 m!397079))

(declare-fun m!397081 () Bool)

(assert (=> b!266312 m!397081))

(declare-fun m!397083 () Bool)

(assert (=> b!266311 m!397083))

(declare-fun m!397085 () Bool)

(assert (=> b!266308 m!397085))

(declare-fun m!397087 () Bool)

(assert (=> b!266308 m!397087))

(declare-fun m!397089 () Bool)

(assert (=> b!266308 m!397089))

(declare-fun m!397091 () Bool)

(assert (=> b!266308 m!397091))

(declare-fun m!397093 () Bool)

(assert (=> b!266308 m!397093))

(declare-fun m!397095 () Bool)

(assert (=> b!266308 m!397095))

(declare-fun m!397097 () Bool)

(assert (=> b!266304 m!397097))

(assert (=> b!266304 m!397097))

(declare-fun m!397099 () Bool)

(assert (=> b!266304 m!397099))

(assert (=> b!266310 m!397097))

(declare-fun m!397101 () Bool)

(assert (=> b!266310 m!397101))

(declare-fun m!397103 () Bool)

(assert (=> b!266310 m!397103))

(assert (=> b!266309 m!397097))

(assert (=> b!266309 m!397097))

(declare-fun m!397105 () Bool)

(assert (=> b!266309 m!397105))

(declare-fun m!397107 () Bool)

(assert (=> start!58026 m!397107))

(declare-fun m!397109 () Bool)

(assert (=> start!58026 m!397109))

(declare-fun m!397111 () Bool)

(assert (=> start!58026 m!397111))

(push 1)

(assert (not b!266311))

(assert (not b!266309))

(assert (not start!58026))

(assert (not b!266304))

(assert (not b!266312))

(assert (not b!266308))

(assert (not b!266306))

(assert (not b!266310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

