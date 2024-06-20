; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52360 () Bool)

(assert start!52360)

(declare-fun b!240993 () Bool)

(declare-fun res!201188 () Bool)

(declare-fun e!166988 () Bool)

(assert (=> b!240993 (=> (not res!201188) (not e!166988))))

(declare-datatypes ((array!13189 0))(
  ( (array!13190 (arr!6763 (Array (_ BitVec 32) (_ BitVec 8))) (size!5776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10474 0))(
  ( (BitStream!10475 (buf!6242 array!13189) (currentByte!11602 (_ BitVec 32)) (currentBit!11597 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10474)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240993 (= res!201188 (validate_offset_bits!1 ((_ sign_extend 32) (size!5776 (buf!6242 thiss!982))) ((_ sign_extend 32) (currentByte!11602 thiss!982)) ((_ sign_extend 32) (currentBit!11597 thiss!982)) nBits!288))))

(declare-fun b!240994 () Bool)

(assert (=> b!240994 (= e!166988 (not true))))

(declare-datatypes ((tuple2!20502 0))(
  ( (tuple2!20503 (_1!11173 BitStream!10474) (_2!11173 BitStream!10474)) )
))
(declare-fun lt!376570 () tuple2!20502)

(declare-datatypes ((Unit!17653 0))(
  ( (Unit!17654) )
))
(declare-datatypes ((tuple2!20504 0))(
  ( (tuple2!20505 (_1!11174 Unit!17653) (_2!11174 BitStream!10474)) )
))
(declare-fun lt!376571 () tuple2!20504)

(declare-fun reader!0 (BitStream!10474 BitStream!10474) tuple2!20502)

(assert (=> b!240994 (= lt!376570 (reader!0 thiss!982 (_2!11174 lt!376571)))))

(declare-fun lt!376565 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10474 BitStream!10474) Bool)

(assert (=> b!240994 (= lt!376565 (isPrefixOf!0 thiss!982 (_2!11174 lt!376571)))))

(declare-fun lt!376566 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240994 (= lt!376566 (bitIndex!0 (size!5776 (buf!6242 (_2!11174 lt!376571))) (currentByte!11602 (_2!11174 lt!376571)) (currentBit!11597 (_2!11174 lt!376571))))))

(declare-fun lt!376569 () (_ BitVec 64))

(assert (=> b!240994 (= lt!376569 (bitIndex!0 (size!5776 (buf!6242 thiss!982)) (currentByte!11602 thiss!982) (currentBit!11597 thiss!982)))))

(declare-fun e!166990 () Bool)

(assert (=> b!240994 e!166990))

(declare-fun res!201186 () Bool)

(assert (=> b!240994 (=> (not res!201186) (not e!166990))))

(assert (=> b!240994 (= res!201186 (= (size!5776 (buf!6242 thiss!982)) (size!5776 (buf!6242 (_2!11174 lt!376571)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10474 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20504)

(assert (=> b!240994 (= lt!376571 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!201187 () Bool)

(assert (=> start!52360 (=> (not res!201187) (not e!166988))))

(assert (=> start!52360 (= res!201187 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52360 e!166988))

(assert (=> start!52360 true))

(declare-fun e!166989 () Bool)

(declare-fun inv!12 (BitStream!10474) Bool)

(assert (=> start!52360 (and (inv!12 thiss!982) e!166989)))

(declare-fun b!240995 () Bool)

(declare-datatypes ((tuple2!20506 0))(
  ( (tuple2!20507 (_1!11175 BitStream!10474) (_2!11175 Bool)) )
))
(declare-fun lt!376568 () tuple2!20506)

(declare-fun lt!376567 () tuple2!20502)

(assert (=> b!240995 (= e!166990 (not (or (not (_2!11175 lt!376568)) (not (= (_1!11175 lt!376568) (_2!11173 lt!376567))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10474 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20506)

(assert (=> b!240995 (= lt!376568 (checkBitsLoopPure!0 (_1!11173 lt!376567) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240995 (validate_offset_bits!1 ((_ sign_extend 32) (size!5776 (buf!6242 (_2!11174 lt!376571)))) ((_ sign_extend 32) (currentByte!11602 thiss!982)) ((_ sign_extend 32) (currentBit!11597 thiss!982)) nBits!288)))

(declare-fun lt!376572 () Unit!17653)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10474 array!13189 (_ BitVec 64)) Unit!17653)

(assert (=> b!240995 (= lt!376572 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6242 (_2!11174 lt!376571)) nBits!288))))

(assert (=> b!240995 (= lt!376567 (reader!0 thiss!982 (_2!11174 lt!376571)))))

(declare-fun b!240996 () Bool)

(declare-fun array_inv!5517 (array!13189) Bool)

(assert (=> b!240996 (= e!166989 (array_inv!5517 (buf!6242 thiss!982)))))

(declare-fun b!240997 () Bool)

(declare-fun res!201189 () Bool)

(assert (=> b!240997 (=> (not res!201189) (not e!166990))))

(assert (=> b!240997 (= res!201189 (isPrefixOf!0 thiss!982 (_2!11174 lt!376571)))))

(declare-fun b!240998 () Bool)

(declare-fun res!201185 () Bool)

(assert (=> b!240998 (=> (not res!201185) (not e!166990))))

(assert (=> b!240998 (= res!201185 (= (bitIndex!0 (size!5776 (buf!6242 (_2!11174 lt!376571))) (currentByte!11602 (_2!11174 lt!376571)) (currentBit!11597 (_2!11174 lt!376571))) (bvadd (bitIndex!0 (size!5776 (buf!6242 thiss!982)) (currentByte!11602 thiss!982) (currentBit!11597 thiss!982)) nBits!288)))))

(assert (= (and start!52360 res!201187) b!240993))

(assert (= (and b!240993 res!201188) b!240994))

(assert (= (and b!240994 res!201186) b!240998))

(assert (= (and b!240998 res!201185) b!240997))

(assert (= (and b!240997 res!201189) b!240995))

(assert (= start!52360 b!240996))

(declare-fun m!363657 () Bool)

(assert (=> b!240994 m!363657))

(declare-fun m!363659 () Bool)

(assert (=> b!240994 m!363659))

(declare-fun m!363661 () Bool)

(assert (=> b!240994 m!363661))

(declare-fun m!363663 () Bool)

(assert (=> b!240994 m!363663))

(declare-fun m!363665 () Bool)

(assert (=> b!240994 m!363665))

(assert (=> b!240997 m!363659))

(declare-fun m!363667 () Bool)

(assert (=> start!52360 m!363667))

(declare-fun m!363669 () Bool)

(assert (=> b!240993 m!363669))

(declare-fun m!363671 () Bool)

(assert (=> b!240996 m!363671))

(declare-fun m!363673 () Bool)

(assert (=> b!240995 m!363673))

(declare-fun m!363675 () Bool)

(assert (=> b!240995 m!363675))

(declare-fun m!363677 () Bool)

(assert (=> b!240995 m!363677))

(assert (=> b!240995 m!363665))

(assert (=> b!240998 m!363661))

(assert (=> b!240998 m!363657))

(push 1)

(assert (not b!240995))

(assert (not b!240996))

(assert (not b!240998))

(assert (not b!240997))

(assert (not b!240994))

(assert (not b!240993))

(assert (not start!52360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

