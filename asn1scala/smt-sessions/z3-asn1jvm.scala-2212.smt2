; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56116 () Bool)

(assert start!56116)

(declare-fun res!217996 () Bool)

(declare-fun e!180790 () Bool)

(assert (=> start!56116 (=> (not res!217996) (not e!180790))))

(declare-datatypes ((array!14265 0))(
  ( (array!14266 (arr!7229 (Array (_ BitVec 32) (_ BitVec 8))) (size!6242 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14265)

(declare-datatypes ((BitStream!11406 0))(
  ( (BitStream!11407 (buf!6764 array!14265) (currentByte!12441 (_ BitVec 32)) (currentBit!12436 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11406)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56116 (= res!217996 (and (= (size!6242 (buf!6764 b1!100)) (size!6242 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56116 e!180790))

(declare-fun e!180788 () Bool)

(declare-fun inv!12 (BitStream!11406) Bool)

(assert (=> start!56116 (and (inv!12 b1!100) e!180788)))

(declare-fun array_inv!5983 (array!14265) Bool)

(assert (=> start!56116 (array_inv!5983 buf!79)))

(assert (=> start!56116 true))

(declare-fun b!260366 () Bool)

(declare-fun res!217995 () Bool)

(assert (=> b!260366 (=> (not res!217995) (not e!180790))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260366 (= res!217995 (validate_offset_bits!1 ((_ sign_extend 32) (size!6242 (buf!6764 b1!100))) ((_ sign_extend 32) (currentByte!12441 b1!100)) ((_ sign_extend 32) (currentBit!12436 b1!100)) bits!81))))

(declare-fun b!260367 () Bool)

(assert (=> b!260367 (= e!180790 (or (bvsgt ((_ sign_extend 32) (size!6242 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12441 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12436 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!260368 () Bool)

(assert (=> b!260368 (= e!180788 (array_inv!5983 (buf!6764 b1!100)))))

(assert (= (and start!56116 res!217996) b!260366))

(assert (= (and b!260366 res!217995) b!260367))

(assert (= start!56116 b!260368))

(declare-fun m!389629 () Bool)

(assert (=> start!56116 m!389629))

(declare-fun m!389631 () Bool)

(assert (=> start!56116 m!389631))

(declare-fun m!389633 () Bool)

(assert (=> b!260366 m!389633))

(declare-fun m!389635 () Bool)

(assert (=> b!260368 m!389635))

(check-sat (not b!260368) (not start!56116) (not b!260366))
(check-sat)
