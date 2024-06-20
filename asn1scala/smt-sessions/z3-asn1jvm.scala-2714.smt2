; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66486 () Bool)

(assert start!66486)

(declare-fun b!297903 () Bool)

(declare-fun res!245856 () Bool)

(declare-fun e!213334 () Bool)

(assert (=> b!297903 (=> (not res!245856) (not e!213334))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17845 0))(
  ( (array!17846 (arr!8813 (Array (_ BitVec 32) (_ BitVec 8))) (size!7733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13470 0))(
  ( (BitStream!13471 (buf!7796 array!17845) (currentByte!14350 (_ BitVec 32)) (currentBit!14345 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13470)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297903 (= res!245856 (validate_offset_bits!1 ((_ sign_extend 32) (size!7733 (buf!7796 thiss!1728))) ((_ sign_extend 32) (currentByte!14350 thiss!1728)) ((_ sign_extend 32) (currentBit!14345 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297906 () Bool)

(declare-fun e!213335 () Bool)

(declare-fun array_inv!7345 (array!17845) Bool)

(assert (=> b!297906 (= e!213335 (array_inv!7345 (buf!7796 thiss!1728)))))

(declare-fun b!297904 () Bool)

(declare-fun res!245857 () Bool)

(assert (=> b!297904 (=> (not res!245857) (not e!213334))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297904 (= res!245857 (bvsge from!505 to!474))))

(declare-fun b!297905 () Bool)

(declare-fun lt!434126 () (_ BitVec 64))

(assert (=> b!297905 (= e!213334 (not (= (bvsub (bvadd lt!434126 to!474) from!505) lt!434126)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297905 (= lt!434126 (bitIndex!0 (size!7733 (buf!7796 thiss!1728)) (currentByte!14350 thiss!1728) (currentBit!14345 thiss!1728)))))

(declare-fun arr!273 () array!17845)

(declare-fun arrayBitRangesEq!0 (array!17845 array!17845 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297905 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434127 () (_ BitVec 64))

(declare-datatypes ((Unit!20787 0))(
  ( (Unit!20788) )
))
(declare-fun lt!434124 () Unit!20787)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17845 array!17845 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20787)

(assert (=> b!297905 (= lt!434124 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434127 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297905 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434127)))

(assert (=> b!297905 (= lt!434127 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7733 arr!273))))))

(declare-fun lt!434125 () Unit!20787)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17845) Unit!20787)

(assert (=> b!297905 (= lt!434125 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245858 () Bool)

(assert (=> start!66486 (=> (not res!245858) (not e!213334))))

(assert (=> start!66486 (= res!245858 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7733 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66486 e!213334))

(declare-fun inv!12 (BitStream!13470) Bool)

(assert (=> start!66486 (and (inv!12 thiss!1728) e!213335)))

(assert (=> start!66486 true))

(assert (=> start!66486 (array_inv!7345 arr!273)))

(assert (= (and start!66486 res!245858) b!297903))

(assert (= (and b!297903 res!245856) b!297904))

(assert (= (and b!297904 res!245857) b!297905))

(assert (= start!66486 b!297906))

(declare-fun m!436759 () Bool)

(assert (=> b!297903 m!436759))

(declare-fun m!436761 () Bool)

(assert (=> b!297906 m!436761))

(declare-fun m!436763 () Bool)

(assert (=> b!297905 m!436763))

(declare-fun m!436765 () Bool)

(assert (=> b!297905 m!436765))

(declare-fun m!436767 () Bool)

(assert (=> b!297905 m!436767))

(declare-fun m!436769 () Bool)

(assert (=> b!297905 m!436769))

(declare-fun m!436771 () Bool)

(assert (=> b!297905 m!436771))

(declare-fun m!436773 () Bool)

(assert (=> start!66486 m!436773))

(declare-fun m!436775 () Bool)

(assert (=> start!66486 m!436775))

(check-sat (not b!297906) (not b!297905) (not b!297903) (not start!66486))
(check-sat)
