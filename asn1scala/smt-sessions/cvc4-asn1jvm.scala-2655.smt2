; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65300 () Bool)

(assert start!65300)

(declare-fun res!241897 () Bool)

(declare-fun e!209031 () Bool)

(assert (=> start!65300 (=> (not res!241897) (not e!209031))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17448 0))(
  ( (array!17449 (arr!8583 (Array (_ BitVec 32) (_ BitVec 8))) (size!7557 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17448)

(assert (=> start!65300 (= res!241897 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7557 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65300 e!209031))

(declare-datatypes ((BitStream!13118 0))(
  ( (BitStream!13119 (buf!7620 array!17448) (currentByte!14084 (_ BitVec 32)) (currentBit!14079 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13118)

(declare-fun e!209028 () Bool)

(declare-fun inv!12 (BitStream!13118) Bool)

(assert (=> start!65300 (and (inv!12 thiss!1728) e!209028)))

(assert (=> start!65300 true))

(declare-fun array_inv!7169 (array!17448) Bool)

(assert (=> start!65300 (array_inv!7169 arr!273)))

(declare-fun b!292894 () Bool)

(declare-fun res!241898 () Bool)

(assert (=> b!292894 (=> (not res!241898) (not e!209031))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292894 (= res!241898 (validate_offset_bits!1 ((_ sign_extend 32) (size!7557 (buf!7620 thiss!1728))) ((_ sign_extend 32) (currentByte!14084 thiss!1728)) ((_ sign_extend 32) (currentBit!14079 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292895 () Bool)

(assert (=> b!292895 (= e!209031 (and (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!292896 () Bool)

(assert (=> b!292896 (= e!209028 (array_inv!7169 (buf!7620 thiss!1728)))))

(assert (= (and start!65300 res!241897) b!292894))

(assert (= (and b!292894 res!241898) b!292895))

(assert (= start!65300 b!292896))

(declare-fun m!428507 () Bool)

(assert (=> start!65300 m!428507))

(declare-fun m!428509 () Bool)

(assert (=> start!65300 m!428509))

(declare-fun m!428511 () Bool)

(assert (=> b!292894 m!428511))

(declare-fun m!428513 () Bool)

(assert (=> b!292896 m!428513))

(push 1)

(assert (not b!292894))

(assert (not start!65300))

(assert (not b!292896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

