; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55138 () Bool)

(assert start!55138)

(declare-fun b!257274 () Bool)

(declare-fun e!178381 () Bool)

(assert (=> b!257274 (= e!178381 false)))

(declare-fun lt!398627 () (_ BitVec 64))

(declare-datatypes ((array!13974 0))(
  ( (array!13975 (arr!7114 (Array (_ BitVec 32) (_ BitVec 8))) (size!6127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11176 0))(
  ( (BitStream!11177 (buf!6649 array!13974) (currentByte!12194 (_ BitVec 32)) (currentBit!12189 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22004 0))(
  ( (tuple2!22005 (_1!11938 Bool) (_2!11938 BitStream!11176)) )
))
(declare-fun lt!398625 () tuple2!22004)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257274 (= lt!398627 (bitIndex!0 (size!6127 (buf!6649 (_2!11938 lt!398625))) (currentByte!12194 (_2!11938 lt!398625)) (currentBit!12189 (_2!11938 lt!398625))))))

(declare-fun lt!398626 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11176)

(assert (=> b!257274 (= lt!398626 (bitIndex!0 (size!6127 (buf!6649 thiss!1754)) (currentByte!12194 thiss!1754) (currentBit!12189 thiss!1754)))))

(declare-fun b!257275 () Bool)

(declare-fun res!215620 () Bool)

(declare-fun e!178382 () Bool)

(assert (=> b!257275 (=> (not res!215620) (not e!178382))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257275 (= res!215620 (validate_offset_bits!1 ((_ sign_extend 32) (size!6127 (buf!6649 thiss!1754))) ((_ sign_extend 32) (currentByte!12194 thiss!1754)) ((_ sign_extend 32) (currentBit!12189 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257276 () Bool)

(declare-fun e!178384 () Bool)

(declare-fun array_inv!5868 (array!13974) Bool)

(assert (=> b!257276 (= e!178384 (array_inv!5868 (buf!6649 thiss!1754)))))

(declare-fun b!257278 () Bool)

(declare-fun res!215621 () Bool)

(assert (=> b!257278 (=> (not res!215621) (not e!178382))))

(assert (=> b!257278 (= res!215621 (not (= from!526 nBits!535)))))

(declare-fun b!257277 () Bool)

(assert (=> b!257277 (= e!178382 e!178381)))

(declare-fun res!215623 () Bool)

(assert (=> b!257277 (=> (not res!215623) (not e!178381))))

(declare-fun expected!109 () Bool)

(assert (=> b!257277 (= res!215623 (and (= (_1!11938 lt!398625) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6127 (buf!6649 thiss!1754)) (size!6127 (buf!6649 (_2!11938 lt!398625))))))))

(declare-fun readBit!0 (BitStream!11176) tuple2!22004)

(assert (=> b!257277 (= lt!398625 (readBit!0 thiss!1754))))

(declare-fun res!215622 () Bool)

(assert (=> start!55138 (=> (not res!215622) (not e!178382))))

(assert (=> start!55138 (= res!215622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55138 e!178382))

(assert (=> start!55138 true))

(declare-fun inv!12 (BitStream!11176) Bool)

(assert (=> start!55138 (and (inv!12 thiss!1754) e!178384)))

(assert (= (and start!55138 res!215622) b!257275))

(assert (= (and b!257275 res!215620) b!257278))

(assert (= (and b!257278 res!215621) b!257277))

(assert (= (and b!257277 res!215623) b!257274))

(assert (= start!55138 b!257276))

(declare-fun m!386813 () Bool)

(assert (=> start!55138 m!386813))

(declare-fun m!386815 () Bool)

(assert (=> b!257276 m!386815))

(declare-fun m!386817 () Bool)

(assert (=> b!257274 m!386817))

(declare-fun m!386819 () Bool)

(assert (=> b!257274 m!386819))

(declare-fun m!386821 () Bool)

(assert (=> b!257277 m!386821))

(declare-fun m!386823 () Bool)

(assert (=> b!257275 m!386823))

(push 1)

(assert (not start!55138))

(assert (not b!257275))

(assert (not b!257277))

(assert (not b!257276))

(assert (not b!257274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

