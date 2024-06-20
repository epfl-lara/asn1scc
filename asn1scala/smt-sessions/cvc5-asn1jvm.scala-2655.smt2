; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65296 () Bool)

(assert start!65296)

(declare-fun res!241885 () Bool)

(declare-fun e!209007 () Bool)

(assert (=> start!65296 (=> (not res!241885) (not e!209007))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17444 0))(
  ( (array!17445 (arr!8581 (Array (_ BitVec 32) (_ BitVec 8))) (size!7555 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17444)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!65296 (= res!241885 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7555 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65296 e!209007))

(declare-datatypes ((BitStream!13114 0))(
  ( (BitStream!13115 (buf!7618 array!17444) (currentByte!14082 (_ BitVec 32)) (currentBit!14077 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13114)

(declare-fun e!209006 () Bool)

(declare-fun inv!12 (BitStream!13114) Bool)

(assert (=> start!65296 (and (inv!12 thiss!1728) e!209006)))

(assert (=> start!65296 true))

(declare-fun array_inv!7167 (array!17444) Bool)

(assert (=> start!65296 (array_inv!7167 arr!273)))

(declare-fun b!292876 () Bool)

(declare-fun res!241886 () Bool)

(assert (=> b!292876 (=> (not res!241886) (not e!209007))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292876 (= res!241886 (validate_offset_bits!1 ((_ sign_extend 32) (size!7555 (buf!7618 thiss!1728))) ((_ sign_extend 32) (currentByte!14082 thiss!1728)) ((_ sign_extend 32) (currentBit!14077 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292877 () Bool)

(assert (=> b!292877 (= e!209007 (and (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!292878 () Bool)

(assert (=> b!292878 (= e!209006 (array_inv!7167 (buf!7618 thiss!1728)))))

(assert (= (and start!65296 res!241885) b!292876))

(assert (= (and b!292876 res!241886) b!292877))

(assert (= start!65296 b!292878))

(declare-fun m!428491 () Bool)

(assert (=> start!65296 m!428491))

(declare-fun m!428493 () Bool)

(assert (=> start!65296 m!428493))

(declare-fun m!428495 () Bool)

(assert (=> b!292876 m!428495))

(declare-fun m!428497 () Bool)

(assert (=> b!292878 m!428497))

(push 1)

(assert (not start!65296))

(assert (not b!292878))

(assert (not b!292876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

