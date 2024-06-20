; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57390 () Bool)

(assert start!57390)

(declare-fun res!220038 () Bool)

(declare-fun e!183169 () Bool)

(assert (=> start!57390 (=> (not res!220038) (not e!183169))))

(declare-datatypes ((array!14666 0))(
  ( (array!14667 (arr!7387 (Array (_ BitVec 32) (_ BitVec 8))) (size!6400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11614 0))(
  ( (BitStream!11615 (buf!6868 array!14666) (currentByte!12720 (_ BitVec 32)) (currentBit!12715 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11614)

(declare-fun w2!580 () BitStream!11614)

(declare-fun isPrefixOf!0 (BitStream!11614 BitStream!11614) Bool)

(assert (=> start!57390 (= res!220038 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57390 e!183169))

(declare-fun e!183168 () Bool)

(declare-fun inv!12 (BitStream!11614) Bool)

(assert (=> start!57390 (and (inv!12 w1!584) e!183168)))

(declare-fun e!183170 () Bool)

(assert (=> start!57390 (and (inv!12 w2!580) e!183170)))

(declare-fun b!262953 () Bool)

(declare-fun array_inv!6124 (array!14666) Bool)

(assert (=> b!262953 (= e!183170 (array_inv!6124 (buf!6868 w2!580)))))

(declare-fun b!262954 () Bool)

(declare-fun e!183166 () Bool)

(assert (=> b!262954 (= e!183169 (not e!183166))))

(declare-fun res!220039 () Bool)

(assert (=> b!262954 (=> res!220039 e!183166)))

(declare-fun e!183167 () Bool)

(assert (=> b!262954 (= res!220039 e!183167)))

(declare-fun res!220037 () Bool)

(assert (=> b!262954 (=> (not res!220037) (not e!183167))))

(assert (=> b!262954 (= res!220037 (not (= (size!6400 (buf!6868 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!262954 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18743 0))(
  ( (Unit!18744) )
))
(declare-fun lt!404509 () Unit!18743)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11614) Unit!18743)

(assert (=> b!262954 (= lt!404509 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404511 () BitStream!11614)

(assert (=> b!262954 (isPrefixOf!0 lt!404511 lt!404511)))

(declare-fun lt!404510 () Unit!18743)

(assert (=> b!262954 (= lt!404510 (lemmaIsPrefixRefl!0 lt!404511))))

(assert (=> b!262954 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404512 () Unit!18743)

(assert (=> b!262954 (= lt!404512 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262954 (= lt!404511 (BitStream!11615 (buf!6868 w2!580) (currentByte!12720 w1!584) (currentBit!12715 w1!584)))))

(declare-fun b!262955 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14666 array!14666 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262955 (= e!183167 (not (arrayBitRangesEq!0 (buf!6868 w1!584) (buf!6868 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6400 (buf!6868 w1!584)) (currentByte!12720 w1!584) (currentBit!12715 w1!584)))))))

(declare-fun b!262956 () Bool)

(assert (=> b!262956 (= e!183168 (array_inv!6124 (buf!6868 w1!584)))))

(declare-fun b!262957 () Bool)

(declare-fun res!220036 () Bool)

(assert (=> b!262957 (=> res!220036 e!183166)))

(assert (=> b!262957 (= res!220036 (= (size!6400 (buf!6868 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262958 () Bool)

(assert (=> b!262958 (= e!183166 true)))

(declare-fun lt!404513 () (_ BitVec 64))

(assert (=> b!262958 (= lt!404513 (bitIndex!0 (size!6400 (buf!6868 w1!584)) (currentByte!12720 w1!584) (currentBit!12715 w1!584)))))

(assert (= (and start!57390 res!220038) b!262954))

(assert (= (and b!262954 res!220037) b!262955))

(assert (= (and b!262954 (not res!220039)) b!262957))

(assert (= (and b!262957 (not res!220036)) b!262958))

(assert (= start!57390 b!262956))

(assert (= start!57390 b!262953))

(declare-fun m!393119 () Bool)

(assert (=> b!262955 m!393119))

(assert (=> b!262955 m!393119))

(declare-fun m!393121 () Bool)

(assert (=> b!262955 m!393121))

(declare-fun m!393123 () Bool)

(assert (=> start!57390 m!393123))

(declare-fun m!393125 () Bool)

(assert (=> start!57390 m!393125))

(declare-fun m!393127 () Bool)

(assert (=> start!57390 m!393127))

(declare-fun m!393129 () Bool)

(assert (=> b!262953 m!393129))

(declare-fun m!393131 () Bool)

(assert (=> b!262956 m!393131))

(assert (=> b!262958 m!393119))

(declare-fun m!393133 () Bool)

(assert (=> b!262954 m!393133))

(declare-fun m!393135 () Bool)

(assert (=> b!262954 m!393135))

(declare-fun m!393137 () Bool)

(assert (=> b!262954 m!393137))

(declare-fun m!393139 () Bool)

(assert (=> b!262954 m!393139))

(declare-fun m!393141 () Bool)

(assert (=> b!262954 m!393141))

(declare-fun m!393143 () Bool)

(assert (=> b!262954 m!393143))

(push 1)

(assert (not b!262954))

(assert (not b!262958))

(assert (not b!262955))

(assert (not start!57390))

(assert (not b!262953))

(assert (not b!262956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

