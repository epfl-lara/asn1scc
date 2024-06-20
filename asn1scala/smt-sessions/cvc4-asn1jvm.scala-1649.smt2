; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46110 () Bool)

(assert start!46110)

(declare-datatypes ((array!10838 0))(
  ( (array!10839 (arr!5688 (Array (_ BitVec 32) (_ BitVec 8))) (size!4758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8624 0))(
  ( (BitStream!8625 (buf!5305 array!10838) (currentByte!9962 (_ BitVec 32)) (currentBit!9957 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8624)

(assert (=> start!46110 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!9957 thiss!1933) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9957 thiss!1933)) #b10000000000000000000000000000000))))))

(declare-fun e!151150 () Bool)

(declare-fun inv!12 (BitStream!8624) Bool)

(assert (=> start!46110 (and (inv!12 thiss!1933) e!151150)))

(declare-fun b!222489 () Bool)

(declare-fun array_inv!4499 (array!10838) Bool)

(assert (=> b!222489 (= e!151150 (array_inv!4499 (buf!5305 thiss!1933)))))

(assert (= start!46110 b!222489))

(declare-fun m!340719 () Bool)

(assert (=> start!46110 m!340719))

(declare-fun m!340721 () Bool)

(assert (=> b!222489 m!340721))

(push 1)

(assert (not b!222489))

(assert (not start!46110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75265 () Bool)

