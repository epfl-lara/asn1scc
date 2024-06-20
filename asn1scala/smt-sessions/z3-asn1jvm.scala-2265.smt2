; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57392 () Bool)

(assert start!57392)

(declare-fun b!262971 () Bool)

(declare-fun e!183191 () Bool)

(assert (=> b!262971 (= e!183191 true)))

(declare-fun lt!404526 () (_ BitVec 64))

(declare-datatypes ((array!14668 0))(
  ( (array!14669 (arr!7388 (Array (_ BitVec 32) (_ BitVec 8))) (size!6401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11616 0))(
  ( (BitStream!11617 (buf!6869 array!14668) (currentByte!12721 (_ BitVec 32)) (currentBit!12716 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11616)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262971 (= lt!404526 (bitIndex!0 (size!6401 (buf!6869 w1!584)) (currentByte!12721 w1!584) (currentBit!12716 w1!584)))))

(declare-fun b!262972 () Bool)

(declare-fun e!183186 () Bool)

(declare-fun array_inv!6125 (array!14668) Bool)

(assert (=> b!262972 (= e!183186 (array_inv!6125 (buf!6869 w1!584)))))

(declare-fun res!220050 () Bool)

(declare-fun e!183187 () Bool)

(assert (=> start!57392 (=> (not res!220050) (not e!183187))))

(declare-fun w2!580 () BitStream!11616)

(declare-fun isPrefixOf!0 (BitStream!11616 BitStream!11616) Bool)

(assert (=> start!57392 (= res!220050 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57392 e!183187))

(declare-fun inv!12 (BitStream!11616) Bool)

(assert (=> start!57392 (and (inv!12 w1!584) e!183186)))

(declare-fun e!183189 () Bool)

(assert (=> start!57392 (and (inv!12 w2!580) e!183189)))

(declare-fun b!262973 () Bool)

(assert (=> b!262973 (= e!183187 (not e!183191))))

(declare-fun res!220049 () Bool)

(assert (=> b!262973 (=> res!220049 e!183191)))

(declare-fun e!183190 () Bool)

(assert (=> b!262973 (= res!220049 e!183190)))

(declare-fun res!220048 () Bool)

(assert (=> b!262973 (=> (not res!220048) (not e!183190))))

(assert (=> b!262973 (= res!220048 (not (= (size!6401 (buf!6869 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!262973 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18745 0))(
  ( (Unit!18746) )
))
(declare-fun lt!404528 () Unit!18745)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11616) Unit!18745)

(assert (=> b!262973 (= lt!404528 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404527 () BitStream!11616)

(assert (=> b!262973 (isPrefixOf!0 lt!404527 lt!404527)))

(declare-fun lt!404525 () Unit!18745)

(assert (=> b!262973 (= lt!404525 (lemmaIsPrefixRefl!0 lt!404527))))

(assert (=> b!262973 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404524 () Unit!18745)

(assert (=> b!262973 (= lt!404524 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262973 (= lt!404527 (BitStream!11617 (buf!6869 w2!580) (currentByte!12721 w1!584) (currentBit!12716 w1!584)))))

(declare-fun b!262974 () Bool)

(assert (=> b!262974 (= e!183189 (array_inv!6125 (buf!6869 w2!580)))))

(declare-fun b!262975 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14668 array!14668 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262975 (= e!183190 (not (arrayBitRangesEq!0 (buf!6869 w1!584) (buf!6869 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6401 (buf!6869 w1!584)) (currentByte!12721 w1!584) (currentBit!12716 w1!584)))))))

(declare-fun b!262976 () Bool)

(declare-fun res!220051 () Bool)

(assert (=> b!262976 (=> res!220051 e!183191)))

(assert (=> b!262976 (= res!220051 (= (size!6401 (buf!6869 w1!584)) #b00000000000000000000000000000000))))

(assert (= (and start!57392 res!220050) b!262973))

(assert (= (and b!262973 res!220048) b!262975))

(assert (= (and b!262973 (not res!220049)) b!262976))

(assert (= (and b!262976 (not res!220051)) b!262971))

(assert (= start!57392 b!262972))

(assert (= start!57392 b!262974))

(declare-fun m!393145 () Bool)

(assert (=> b!262974 m!393145))

(declare-fun m!393147 () Bool)

(assert (=> b!262973 m!393147))

(declare-fun m!393149 () Bool)

(assert (=> b!262973 m!393149))

(declare-fun m!393151 () Bool)

(assert (=> b!262973 m!393151))

(declare-fun m!393153 () Bool)

(assert (=> b!262973 m!393153))

(declare-fun m!393155 () Bool)

(assert (=> b!262973 m!393155))

(declare-fun m!393157 () Bool)

(assert (=> b!262973 m!393157))

(declare-fun m!393159 () Bool)

(assert (=> b!262972 m!393159))

(declare-fun m!393161 () Bool)

(assert (=> start!57392 m!393161))

(declare-fun m!393163 () Bool)

(assert (=> start!57392 m!393163))

(declare-fun m!393165 () Bool)

(assert (=> start!57392 m!393165))

(declare-fun m!393167 () Bool)

(assert (=> b!262975 m!393167))

(assert (=> b!262975 m!393167))

(declare-fun m!393169 () Bool)

(assert (=> b!262975 m!393169))

(assert (=> b!262971 m!393167))

(check-sat (not b!262973) (not b!262971) (not b!262974) (not b!262972) (not start!57392) (not b!262975))
