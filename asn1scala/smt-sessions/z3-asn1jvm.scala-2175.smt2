; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55152 () Bool)

(assert start!55152)

(declare-fun b!257379 () Bool)

(declare-fun res!215707 () Bool)

(declare-fun e!178466 () Bool)

(assert (=> b!257379 (=> (not res!215707) (not e!178466))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13988 0))(
  ( (array!13989 (arr!7121 (Array (_ BitVec 32) (_ BitVec 8))) (size!6134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11190 0))(
  ( (BitStream!11191 (buf!6656 array!13988) (currentByte!12201 (_ BitVec 32)) (currentBit!12196 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11190)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257379 (= res!215707 (validate_offset_bits!1 ((_ sign_extend 32) (size!6134 (buf!6656 thiss!1754))) ((_ sign_extend 32) (currentByte!12201 thiss!1754)) ((_ sign_extend 32) (currentBit!12196 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257381 () Bool)

(declare-fun e!178467 () Bool)

(assert (=> b!257381 (= e!178467 false)))

(declare-fun lt!398690 () (_ BitVec 64))

(declare-datatypes ((tuple2!22018 0))(
  ( (tuple2!22019 (_1!11945 Bool) (_2!11945 BitStream!11190)) )
))
(declare-fun lt!398689 () tuple2!22018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257381 (= lt!398690 (bitIndex!0 (size!6134 (buf!6656 (_2!11945 lt!398689))) (currentByte!12201 (_2!11945 lt!398689)) (currentBit!12196 (_2!11945 lt!398689))))))

(declare-fun lt!398688 () (_ BitVec 64))

(assert (=> b!257381 (= lt!398688 (bitIndex!0 (size!6134 (buf!6656 thiss!1754)) (currentByte!12201 thiss!1754) (currentBit!12196 thiss!1754)))))

(declare-fun b!257382 () Bool)

(declare-fun res!215704 () Bool)

(assert (=> b!257382 (=> (not res!215704) (not e!178466))))

(assert (=> b!257382 (= res!215704 (not (= from!526 nBits!535)))))

(declare-fun b!257383 () Bool)

(declare-fun e!178465 () Bool)

(declare-fun array_inv!5875 (array!13988) Bool)

(assert (=> b!257383 (= e!178465 (array_inv!5875 (buf!6656 thiss!1754)))))

(declare-fun res!215705 () Bool)

(assert (=> start!55152 (=> (not res!215705) (not e!178466))))

(assert (=> start!55152 (= res!215705 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55152 e!178466))

(assert (=> start!55152 true))

(declare-fun inv!12 (BitStream!11190) Bool)

(assert (=> start!55152 (and (inv!12 thiss!1754) e!178465)))

(declare-fun b!257380 () Bool)

(assert (=> b!257380 (= e!178466 e!178467)))

(declare-fun res!215706 () Bool)

(assert (=> b!257380 (=> (not res!215706) (not e!178467))))

(declare-fun expected!109 () Bool)

(assert (=> b!257380 (= res!215706 (and (= (_1!11945 lt!398689) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (= (size!6134 (buf!6656 thiss!1754)) (size!6134 (buf!6656 (_2!11945 lt!398689))))))))

(declare-fun readBit!0 (BitStream!11190) tuple2!22018)

(assert (=> b!257380 (= lt!398689 (readBit!0 thiss!1754))))

(assert (= (and start!55152 res!215705) b!257379))

(assert (= (and b!257379 res!215707) b!257382))

(assert (= (and b!257382 res!215704) b!257380))

(assert (= (and b!257380 res!215706) b!257381))

(assert (= start!55152 b!257383))

(declare-fun m!386897 () Bool)

(assert (=> b!257383 m!386897))

(declare-fun m!386899 () Bool)

(assert (=> b!257381 m!386899))

(declare-fun m!386901 () Bool)

(assert (=> b!257381 m!386901))

(declare-fun m!386903 () Bool)

(assert (=> b!257379 m!386903))

(declare-fun m!386905 () Bool)

(assert (=> start!55152 m!386905))

(declare-fun m!386907 () Bool)

(assert (=> b!257380 m!386907))

(check-sat (not b!257381) (not b!257383) (not b!257380) (not b!257379) (not start!55152))
