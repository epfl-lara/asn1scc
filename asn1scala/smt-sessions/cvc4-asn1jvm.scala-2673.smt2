; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65462 () Bool)

(assert start!65462)

(declare-fun b!293602 () Bool)

(declare-fun res!242444 () Bool)

(declare-fun e!209751 () Bool)

(assert (=> b!293602 (=> (not res!242444) (not e!209751))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293602 (= res!242444 (bvslt from!505 to!474))))

(declare-fun res!242443 () Bool)

(assert (=> start!65462 (=> (not res!242443) (not e!209751))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17562 0))(
  ( (array!17563 (arr!8637 (Array (_ BitVec 32) (_ BitVec 8))) (size!7611 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17562)

(assert (=> start!65462 (= res!242443 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7611 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65462 e!209751))

(declare-datatypes ((BitStream!13226 0))(
  ( (BitStream!13227 (buf!7674 array!17562) (currentByte!14147 (_ BitVec 32)) (currentBit!14142 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13226)

(declare-fun e!209749 () Bool)

(declare-fun inv!12 (BitStream!13226) Bool)

(assert (=> start!65462 (and (inv!12 thiss!1728) e!209749)))

(assert (=> start!65462 true))

(declare-fun array_inv!7223 (array!17562) Bool)

(assert (=> start!65462 (array_inv!7223 arr!273)))

(declare-fun b!293604 () Bool)

(assert (=> b!293604 (= e!209749 (array_inv!7223 (buf!7674 thiss!1728)))))

(declare-fun b!293603 () Bool)

(assert (=> b!293603 (= e!209751 (not (bvslt (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsub to!474 from!505))))))

(declare-datatypes ((tuple2!23060 0))(
  ( (tuple2!23061 (_1!12835 Bool) (_2!12835 BitStream!13226)) )
))
(declare-fun lt!425534 () tuple2!23060)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293603 (validate_offset_bits!1 ((_ sign_extend 32) (size!7611 (buf!7674 (_2!12835 lt!425534)))) ((_ sign_extend 32) (currentByte!14147 (_2!12835 lt!425534))) ((_ sign_extend 32) (currentBit!14142 (_2!12835 lt!425534))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20411 0))(
  ( (Unit!20412) )
))
(declare-fun lt!425535 () Unit!20411)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13226 BitStream!13226 (_ BitVec 64) (_ BitVec 64)) Unit!20411)

(assert (=> b!293603 (= lt!425535 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12835 lt!425534) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13226) tuple2!23060)

(assert (=> b!293603 (= lt!425534 (readBit!0 thiss!1728))))

(declare-fun b!293601 () Bool)

(declare-fun res!242442 () Bool)

(assert (=> b!293601 (=> (not res!242442) (not e!209751))))

(assert (=> b!293601 (= res!242442 (validate_offset_bits!1 ((_ sign_extend 32) (size!7611 (buf!7674 thiss!1728))) ((_ sign_extend 32) (currentByte!14147 thiss!1728)) ((_ sign_extend 32) (currentBit!14142 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65462 res!242443) b!293601))

(assert (= (and b!293601 res!242442) b!293602))

(assert (= (and b!293602 res!242444) b!293603))

(assert (= start!65462 b!293604))

(declare-fun m!429155 () Bool)

(assert (=> start!65462 m!429155))

(declare-fun m!429157 () Bool)

(assert (=> start!65462 m!429157))

(declare-fun m!429159 () Bool)

(assert (=> b!293604 m!429159))

(declare-fun m!429161 () Bool)

(assert (=> b!293603 m!429161))

(declare-fun m!429163 () Bool)

(assert (=> b!293603 m!429163))

(declare-fun m!429165 () Bool)

(assert (=> b!293603 m!429165))

(declare-fun m!429167 () Bool)

(assert (=> b!293601 m!429167))

(push 1)

(assert (not b!293601))

(assert (not b!293603))

(assert (not start!65462))

(assert (not b!293604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

