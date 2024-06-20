; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49186 () Bool)

(assert start!49186)

(declare-fun b!233616 () Bool)

(declare-fun res!195440 () Bool)

(declare-fun e!160993 () Bool)

(assert (=> b!233616 (=> (not res!195440) (not e!160993))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!12074 0))(
  ( (array!12075 (arr!6285 (Array (_ BitVec 32) (_ BitVec 8))) (size!5298 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9692 0))(
  ( (BitStream!9693 (buf!5839 array!12074) (currentByte!10873 (_ BitVec 32)) (currentBit!10868 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9692)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233616 (= res!195440 (bvsle bits!86 (bitIndex!0 (size!5298 (buf!5839 b2!99)) (currentByte!10873 b2!99) (currentBit!10868 b2!99))))))

(declare-fun res!195439 () Bool)

(assert (=> start!49186 (=> (not res!195439) (not e!160993))))

(declare-fun b1!101 () BitStream!9692)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!49186 (= res!195439 (and (= (size!5298 (buf!5839 b1!101)) (size!5298 (buf!5839 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49186 e!160993))

(declare-fun e!160994 () Bool)

(declare-fun inv!12 (BitStream!9692) Bool)

(assert (=> start!49186 (and (inv!12 b1!101) e!160994)))

(declare-fun e!160996 () Bool)

(assert (=> start!49186 (and (inv!12 b2!99) e!160996)))

(assert (=> start!49186 true))

(declare-fun b!233617 () Bool)

(assert (=> b!233617 (= e!160993 false)))

(declare-fun lt!369516 () (_ BitVec 64))

(assert (=> b!233617 (= lt!369516 (bitIndex!0 (size!5298 (buf!5839 b1!101)) (currentByte!10873 b1!101) (currentBit!10868 b1!101)))))

(declare-fun b!233618 () Bool)

(declare-fun res!195441 () Bool)

(assert (=> b!233618 (=> (not res!195441) (not e!160993))))

(assert (=> b!233618 (= res!195441 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233619 () Bool)

(declare-fun array_inv!5039 (array!12074) Bool)

(assert (=> b!233619 (= e!160996 (array_inv!5039 (buf!5839 b2!99)))))

(declare-fun b!233620 () Bool)

(declare-fun res!195438 () Bool)

(assert (=> b!233620 (=> (not res!195438) (not e!160993))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233620 (= res!195438 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5298 (buf!5839 b1!101))) ((_ sign_extend 32) (currentByte!10873 b1!101)) ((_ sign_extend 32) (currentBit!10868 b1!101)) bytes!19))))

(declare-fun b!233621 () Bool)

(assert (=> b!233621 (= e!160994 (array_inv!5039 (buf!5839 b1!101)))))

(assert (= (and start!49186 res!195439) b!233616))

(assert (= (and b!233616 res!195440) b!233618))

(assert (= (and b!233618 res!195441) b!233620))

(assert (= (and b!233620 res!195438) b!233617))

(assert (= start!49186 b!233621))

(assert (= start!49186 b!233619))

(declare-fun m!356145 () Bool)

(assert (=> start!49186 m!356145))

(declare-fun m!356147 () Bool)

(assert (=> start!49186 m!356147))

(declare-fun m!356149 () Bool)

(assert (=> b!233620 m!356149))

(declare-fun m!356151 () Bool)

(assert (=> b!233617 m!356151))

(declare-fun m!356153 () Bool)

(assert (=> b!233619 m!356153))

(declare-fun m!356155 () Bool)

(assert (=> b!233621 m!356155))

(declare-fun m!356157 () Bool)

(assert (=> b!233616 m!356157))

(push 1)

(assert (not b!233621))

(assert (not b!233616))

(assert (not start!49186))

(assert (not b!233617))

(assert (not b!233620))

(assert (not b!233619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

