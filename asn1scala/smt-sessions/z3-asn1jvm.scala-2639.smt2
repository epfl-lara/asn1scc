; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65070 () Bool)

(assert start!65070)

(declare-fun b!292074 () Bool)

(declare-fun e!208260 () Bool)

(declare-datatypes ((array!17353 0))(
  ( (array!17354 (arr!8540 (Array (_ BitVec 32) (_ BitVec 8))) (size!7514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13038 0))(
  ( (BitStream!13039 (buf!7580 array!17353) (currentByte!14023 (_ BitVec 32)) (currentBit!14018 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13038)

(declare-fun array_inv!7126 (array!17353) Bool)

(assert (=> b!292074 (= e!208260 (array_inv!7126 (buf!7580 thiss!1728)))))

(declare-fun b!292073 () Bool)

(declare-fun e!208263 () Bool)

(assert (=> b!292073 (= e!208263 (not true))))

(declare-fun arr!273 () array!17353)

(declare-fun arrayBitRangesEq!0 (array!17353 array!17353 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292073 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7514 arr!273))))))

(declare-datatypes ((Unit!20317 0))(
  ( (Unit!20318) )
))
(declare-fun lt!424470 () Unit!20317)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17353) Unit!20317)

(assert (=> b!292073 (= lt!424470 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292072 () Bool)

(declare-fun res!241268 () Bool)

(assert (=> b!292072 (=> (not res!241268) (not e!208263))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292072 (= res!241268 (bvsge from!505 to!474))))

(declare-fun res!241266 () Bool)

(assert (=> start!65070 (=> (not res!241266) (not e!208263))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65070 (= res!241266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7514 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65070 e!208263))

(declare-fun inv!12 (BitStream!13038) Bool)

(assert (=> start!65070 (and (inv!12 thiss!1728) e!208260)))

(assert (=> start!65070 true))

(assert (=> start!65070 (array_inv!7126 arr!273)))

(declare-fun b!292071 () Bool)

(declare-fun res!241267 () Bool)

(assert (=> b!292071 (=> (not res!241267) (not e!208263))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292071 (= res!241267 (validate_offset_bits!1 ((_ sign_extend 32) (size!7514 (buf!7580 thiss!1728))) ((_ sign_extend 32) (currentByte!14023 thiss!1728)) ((_ sign_extend 32) (currentBit!14018 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65070 res!241266) b!292071))

(assert (= (and b!292071 res!241267) b!292072))

(assert (= (and b!292072 res!241268) b!292073))

(assert (= start!65070 b!292074))

(declare-fun m!427501 () Bool)

(assert (=> b!292074 m!427501))

(declare-fun m!427503 () Bool)

(assert (=> b!292073 m!427503))

(declare-fun m!427505 () Bool)

(assert (=> b!292073 m!427505))

(declare-fun m!427507 () Bool)

(assert (=> start!65070 m!427507))

(declare-fun m!427509 () Bool)

(assert (=> start!65070 m!427509))

(declare-fun m!427511 () Bool)

(assert (=> b!292071 m!427511))

(check-sat (not b!292071) (not b!292073) (not b!292074) (not start!65070))
