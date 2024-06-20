; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38486 () Bool)

(assert start!38486)

(declare-fun b!172883 () Bool)

(declare-fun res!143183 () Bool)

(declare-fun e!120781 () Bool)

(assert (=> b!172883 (=> (not res!143183) (not e!120781))))

(declare-datatypes ((array!9292 0))(
  ( (array!9293 (arr!5030 (Array (_ BitVec 32) (_ BitVec 8))) (size!4100 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7308 0))(
  ( (BitStream!7309 (buf!4528 array!9292) (currentByte!8615 (_ BitVec 32)) (currentBit!8610 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7308)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172883 (= res!143183 (invariant!0 (currentBit!8610 thiss!1187) (currentByte!8615 thiss!1187) (size!4100 (buf!4528 thiss!1187))))))

(declare-fun b!172884 () Bool)

(declare-fun res!143184 () Bool)

(assert (=> b!172884 (=> (not res!143184) (not e!120781))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172884 (= res!143184 (validate_offset_bits!1 ((_ sign_extend 32) (size!4100 (buf!4528 thiss!1187))) ((_ sign_extend 32) (currentByte!8615 thiss!1187)) ((_ sign_extend 32) (currentBit!8610 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172885 () Bool)

(declare-fun e!120779 () Bool)

(assert (=> b!172885 (= e!120779 false)))

(declare-fun lt!266568 () (_ BitVec 64))

(declare-datatypes ((Unit!12369 0))(
  ( (Unit!12370) )
))
(declare-datatypes ((tuple2!14862 0))(
  ( (tuple2!14863 (_1!8073 Unit!12369) (_2!8073 BitStream!7308)) )
))
(declare-fun lt!266569 () tuple2!14862)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172885 (= lt!266568 (bitIndex!0 (size!4100 (buf!4528 (_2!8073 lt!266569))) (currentByte!8615 (_2!8073 lt!266569)) (currentBit!8610 (_2!8073 lt!266569))))))

(declare-fun lt!266570 () (_ BitVec 64))

(assert (=> b!172885 (= lt!266570 (bitIndex!0 (size!4100 (buf!4528 thiss!1187)) (currentByte!8615 thiss!1187) (currentBit!8610 thiss!1187)))))

(declare-fun b!172887 () Bool)

(assert (=> b!172887 (= e!120781 e!120779)))

(declare-fun res!143182 () Bool)

(assert (=> b!172887 (=> (not res!143182) (not e!120779))))

(assert (=> b!172887 (= res!143182 (= (size!4100 (buf!4528 (_2!8073 lt!266569))) (size!4100 (buf!4528 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14862)

(assert (=> b!172887 (= lt!266569 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!143181 () Bool)

(assert (=> start!38486 (=> (not res!143181) (not e!120781))))

(assert (=> start!38486 (= res!143181 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38486 e!120781))

(assert (=> start!38486 true))

(declare-fun e!120778 () Bool)

(declare-fun inv!12 (BitStream!7308) Bool)

(assert (=> start!38486 (and (inv!12 thiss!1187) e!120778)))

(declare-fun b!172886 () Bool)

(declare-fun array_inv!3841 (array!9292) Bool)

(assert (=> b!172886 (= e!120778 (array_inv!3841 (buf!4528 thiss!1187)))))

(assert (= (and start!38486 res!143181) b!172884))

(assert (= (and b!172884 res!143184) b!172883))

(assert (= (and b!172883 res!143183) b!172887))

(assert (= (and b!172887 res!143182) b!172885))

(assert (= start!38486 b!172886))

(declare-fun m!272057 () Bool)

(assert (=> start!38486 m!272057))

(declare-fun m!272059 () Bool)

(assert (=> b!172885 m!272059))

(declare-fun m!272061 () Bool)

(assert (=> b!172885 m!272061))

(declare-fun m!272063 () Bool)

(assert (=> b!172886 m!272063))

(declare-fun m!272065 () Bool)

(assert (=> b!172887 m!272065))

(declare-fun m!272067 () Bool)

(assert (=> b!172884 m!272067))

(declare-fun m!272069 () Bool)

(assert (=> b!172883 m!272069))

(check-sat (not b!172886) (not b!172887) (not b!172883) (not start!38486) (not b!172884) (not b!172885))
