; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55122 () Bool)

(assert start!55122)

(declare-fun res!215527 () Bool)

(declare-fun e!178286 () Bool)

(assert (=> start!55122 (=> (not res!215527) (not e!178286))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55122 (= res!215527 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55122 e!178286))

(assert (=> start!55122 true))

(declare-datatypes ((array!13958 0))(
  ( (array!13959 (arr!7106 (Array (_ BitVec 32) (_ BitVec 8))) (size!6119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11160 0))(
  ( (BitStream!11161 (buf!6641 array!13958) (currentByte!12186 (_ BitVec 32)) (currentBit!12181 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11160)

(declare-fun e!178285 () Bool)

(declare-fun inv!12 (BitStream!11160) Bool)

(assert (=> start!55122 (and (inv!12 thiss!1754) e!178285)))

(declare-fun b!257154 () Bool)

(declare-fun e!178288 () Bool)

(assert (=> b!257154 (= e!178286 e!178288)))

(declare-fun res!215524 () Bool)

(assert (=> b!257154 (=> (not res!215524) (not e!178288))))

(declare-datatypes ((tuple2!21988 0))(
  ( (tuple2!21989 (_1!11930 Bool) (_2!11930 BitStream!11160)) )
))
(declare-fun lt!398555 () tuple2!21988)

(declare-fun expected!109 () Bool)

(assert (=> b!257154 (= res!215524 (not (= (_1!11930 lt!398555) expected!109)))))

(declare-fun readBit!0 (BitStream!11160) tuple2!21988)

(assert (=> b!257154 (= lt!398555 (readBit!0 thiss!1754))))

(declare-fun b!257155 () Bool)

(declare-fun array_inv!5860 (array!13958) Bool)

(assert (=> b!257155 (= e!178285 (array_inv!5860 (buf!6641 thiss!1754)))))

(declare-fun b!257156 () Bool)

(declare-fun res!215525 () Bool)

(assert (=> b!257156 (=> (not res!215525) (not e!178286))))

(assert (=> b!257156 (= res!215525 (not (= from!526 nBits!535)))))

(declare-fun b!257157 () Bool)

(declare-fun res!215526 () Bool)

(assert (=> b!257157 (=> (not res!215526) (not e!178286))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257157 (= res!215526 (validate_offset_bits!1 ((_ sign_extend 32) (size!6119 (buf!6641 thiss!1754))) ((_ sign_extend 32) (currentByte!12186 thiss!1754)) ((_ sign_extend 32) (currentBit!12181 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257158 () Bool)

(assert (=> b!257158 (= e!178288 false)))

(declare-fun lt!398553 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257158 (= lt!398553 (bitIndex!0 (size!6119 (buf!6641 (_2!11930 lt!398555))) (currentByte!12186 (_2!11930 lt!398555)) (currentBit!12181 (_2!11930 lt!398555))))))

(declare-fun lt!398554 () (_ BitVec 64))

(assert (=> b!257158 (= lt!398554 (bitIndex!0 (size!6119 (buf!6641 thiss!1754)) (currentByte!12186 thiss!1754) (currentBit!12181 thiss!1754)))))

(assert (= (and start!55122 res!215527) b!257157))

(assert (= (and b!257157 res!215526) b!257156))

(assert (= (and b!257156 res!215525) b!257154))

(assert (= (and b!257154 res!215524) b!257158))

(assert (= start!55122 b!257155))

(declare-fun m!386717 () Bool)

(assert (=> start!55122 m!386717))

(declare-fun m!386719 () Bool)

(assert (=> b!257157 m!386719))

(declare-fun m!386721 () Bool)

(assert (=> b!257155 m!386721))

(declare-fun m!386723 () Bool)

(assert (=> b!257158 m!386723))

(declare-fun m!386725 () Bool)

(assert (=> b!257158 m!386725))

(declare-fun m!386727 () Bool)

(assert (=> b!257154 m!386727))

(check-sat (not start!55122) (not b!257158) (not b!257157) (not b!257154) (not b!257155))
