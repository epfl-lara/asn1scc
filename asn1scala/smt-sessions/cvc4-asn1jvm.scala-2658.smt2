; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65318 () Bool)

(assert start!65318)

(declare-fun res!241978 () Bool)

(declare-fun e!209138 () Bool)

(assert (=> start!65318 (=> (not res!241978) (not e!209138))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17466 0))(
  ( (array!17467 (arr!8592 (Array (_ BitVec 32) (_ BitVec 8))) (size!7566 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17466)

(assert (=> start!65318 (= res!241978 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7566 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65318 e!209138))

(declare-datatypes ((BitStream!13136 0))(
  ( (BitStream!13137 (buf!7629 array!17466) (currentByte!14093 (_ BitVec 32)) (currentBit!14088 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13136)

(declare-fun e!209136 () Bool)

(declare-fun inv!12 (BitStream!13136) Bool)

(assert (=> start!65318 (and (inv!12 thiss!1728) e!209136)))

(assert (=> start!65318 true))

(declare-fun array_inv!7178 (array!17466) Bool)

(assert (=> start!65318 (array_inv!7178 arr!273)))

(declare-fun b!293001 () Bool)

(declare-fun res!241977 () Bool)

(assert (=> b!293001 (=> (not res!241977) (not e!209138))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293001 (= res!241977 (validate_offset_bits!1 ((_ sign_extend 32) (size!7566 (buf!7629 thiss!1728))) ((_ sign_extend 32) (currentByte!14093 thiss!1728)) ((_ sign_extend 32) (currentBit!14088 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293003 () Bool)

(assert (=> b!293003 (= e!209138 (bvsge (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!22962 0))(
  ( (tuple2!22963 (_1!12786 Bool) (_2!12786 BitStream!13136)) )
))
(declare-fun lt!425157 () tuple2!22962)

(declare-fun readBit!0 (BitStream!13136) tuple2!22962)

(assert (=> b!293003 (= lt!425157 (readBit!0 thiss!1728))))

(declare-fun b!293002 () Bool)

(declare-fun res!241979 () Bool)

(assert (=> b!293002 (=> (not res!241979) (not e!209138))))

(assert (=> b!293002 (= res!241979 (bvslt from!505 to!474))))

(declare-fun b!293004 () Bool)

(assert (=> b!293004 (= e!209136 (array_inv!7178 (buf!7629 thiss!1728)))))

(assert (= (and start!65318 res!241978) b!293001))

(assert (= (and b!293001 res!241977) b!293002))

(assert (= (and b!293002 res!241979) b!293003))

(assert (= start!65318 b!293004))

(declare-fun m!428595 () Bool)

(assert (=> start!65318 m!428595))

(declare-fun m!428597 () Bool)

(assert (=> start!65318 m!428597))

(declare-fun m!428599 () Bool)

(assert (=> b!293001 m!428599))

(declare-fun m!428601 () Bool)

(assert (=> b!293003 m!428601))

(declare-fun m!428603 () Bool)

(assert (=> b!293004 m!428603))

(push 1)

(assert (not b!293003))

(assert (not b!293004))

(assert (not start!65318))

(assert (not b!293001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

