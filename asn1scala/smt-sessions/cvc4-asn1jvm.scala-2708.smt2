; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66368 () Bool)

(assert start!66368)

(declare-fun b!297444 () Bool)

(declare-fun e!212931 () Bool)

(declare-datatypes ((array!17805 0))(
  ( (array!17806 (arr!8796 (Array (_ BitVec 32) (_ BitVec 8))) (size!7716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13436 0))(
  ( (BitStream!13437 (buf!7779 array!17805) (currentByte!14321 (_ BitVec 32)) (currentBit!14316 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13436)

(declare-fun array_inv!7328 (array!17805) Bool)

(assert (=> b!297444 (= e!212931 (array_inv!7328 (buf!7779 thiss!1728)))))

(declare-fun b!297443 () Bool)

(declare-fun e!212932 () Bool)

(declare-fun lt!433697 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!297443 (= e!212932 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!433697) (bvsle from!505 lt!433697))))))

(declare-fun arr!273 () array!17805)

(declare-fun arrayBitRangesEq!0 (array!17805 array!17805 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297443 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433697)))

(assert (=> b!297443 (= lt!433697 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7716 arr!273))))))

(declare-datatypes ((Unit!20753 0))(
  ( (Unit!20754) )
))
(declare-fun lt!433698 () Unit!20753)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17805) Unit!20753)

(assert (=> b!297443 (= lt!433698 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297442 () Bool)

(declare-fun res!245493 () Bool)

(assert (=> b!297442 (=> (not res!245493) (not e!212932))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297442 (= res!245493 (bvsge from!505 to!474))))

(declare-fun b!297441 () Bool)

(declare-fun res!245494 () Bool)

(assert (=> b!297441 (=> (not res!245494) (not e!212932))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297441 (= res!245494 (validate_offset_bits!1 ((_ sign_extend 32) (size!7716 (buf!7779 thiss!1728))) ((_ sign_extend 32) (currentByte!14321 thiss!1728)) ((_ sign_extend 32) (currentBit!14316 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245495 () Bool)

(assert (=> start!66368 (=> (not res!245495) (not e!212932))))

(assert (=> start!66368 (= res!245495 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7716 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66368 e!212932))

(declare-fun inv!12 (BitStream!13436) Bool)

(assert (=> start!66368 (and (inv!12 thiss!1728) e!212931)))

(assert (=> start!66368 true))

(assert (=> start!66368 (array_inv!7328 arr!273)))

(assert (= (and start!66368 res!245495) b!297441))

(assert (= (and b!297441 res!245494) b!297442))

(assert (= (and b!297442 res!245493) b!297443))

(assert (= start!66368 b!297444))

(declare-fun m!436261 () Bool)

(assert (=> b!297444 m!436261))

(declare-fun m!436263 () Bool)

(assert (=> b!297443 m!436263))

(declare-fun m!436265 () Bool)

(assert (=> b!297443 m!436265))

(declare-fun m!436267 () Bool)

(assert (=> b!297441 m!436267))

(declare-fun m!436269 () Bool)

(assert (=> start!66368 m!436269))

(declare-fun m!436271 () Bool)

(assert (=> start!66368 m!436271))

(push 1)

(assert (not start!66368))

(assert (not b!297443))

(assert (not b!297444))

(assert (not b!297441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

