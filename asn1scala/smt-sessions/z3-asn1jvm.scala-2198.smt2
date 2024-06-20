; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55740 () Bool)

(assert start!55740)

(declare-fun b!259182 () Bool)

(declare-fun res!217119 () Bool)

(declare-fun e!179805 () Bool)

(assert (=> b!259182 (=> (not res!217119) (not e!179805))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259182 (= res!217119 (not (= from!526 nBits!535)))))

(declare-fun res!217118 () Bool)

(assert (=> start!55740 (=> (not res!217118) (not e!179805))))

(assert (=> start!55740 (= res!217118 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55740 e!179805))

(assert (=> start!55740 true))

(declare-datatypes ((array!14156 0))(
  ( (array!14157 (arr!7187 (Array (_ BitVec 32) (_ BitVec 8))) (size!6200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11322 0))(
  ( (BitStream!11323 (buf!6722 array!14156) (currentByte!12357 (_ BitVec 32)) (currentBit!12352 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11322)

(declare-fun e!179804 () Bool)

(declare-fun inv!12 (BitStream!11322) Bool)

(assert (=> start!55740 (and (inv!12 thiss!1754) e!179804)))

(declare-fun b!259183 () Bool)

(assert (=> b!259183 (= e!179805 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(declare-fun b!259184 () Bool)

(declare-fun array_inv!5941 (array!14156) Bool)

(assert (=> b!259184 (= e!179804 (array_inv!5941 (buf!6722 thiss!1754)))))

(declare-fun b!259185 () Bool)

(declare-fun res!217117 () Bool)

(assert (=> b!259185 (=> (not res!217117) (not e!179805))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22192 0))(
  ( (tuple2!22193 (_1!12032 Bool) (_2!12032 BitStream!11322)) )
))
(declare-fun readBit!0 (BitStream!11322) tuple2!22192)

(assert (=> b!259185 (= res!217117 (= (_1!12032 (readBit!0 thiss!1754)) expected!109))))

(declare-fun b!259186 () Bool)

(declare-fun res!217120 () Bool)

(assert (=> b!259186 (=> (not res!217120) (not e!179805))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259186 (= res!217120 (validate_offset_bits!1 ((_ sign_extend 32) (size!6200 (buf!6722 thiss!1754))) ((_ sign_extend 32) (currentByte!12357 thiss!1754)) ((_ sign_extend 32) (currentBit!12352 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55740 res!217118) b!259186))

(assert (= (and b!259186 res!217120) b!259182))

(assert (= (and b!259182 res!217119) b!259185))

(assert (= (and b!259185 res!217117) b!259183))

(assert (= start!55740 b!259184))

(declare-fun m!388501 () Bool)

(assert (=> start!55740 m!388501))

(declare-fun m!388503 () Bool)

(assert (=> b!259184 m!388503))

(declare-fun m!388505 () Bool)

(assert (=> b!259185 m!388505))

(declare-fun m!388507 () Bool)

(assert (=> b!259186 m!388507))

(check-sat (not b!259185) (not b!259184) (not start!55740) (not b!259186))
(check-sat)
