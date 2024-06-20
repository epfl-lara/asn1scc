; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55818 () Bool)

(assert start!55818)

(declare-fun b!259386 () Bool)

(declare-fun res!217287 () Bool)

(declare-fun e!179982 () Bool)

(assert (=> b!259386 (=> (not res!217287) (not e!179982))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259386 (= res!217287 (not (= from!526 nBits!535)))))

(declare-fun b!259387 () Bool)

(declare-fun res!217285 () Bool)

(assert (=> b!259387 (=> (not res!217285) (not e!179982))))

(declare-datatypes ((array!14186 0))(
  ( (array!14187 (arr!7199 (Array (_ BitVec 32) (_ BitVec 8))) (size!6212 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11346 0))(
  ( (BitStream!11347 (buf!6734 array!14186) (currentByte!12378 (_ BitVec 32)) (currentBit!12373 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11346)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259387 (= res!217285 (validate_offset_bits!1 ((_ sign_extend 32) (size!6212 (buf!6734 thiss!1754))) ((_ sign_extend 32) (currentByte!12378 thiss!1754)) ((_ sign_extend 32) (currentBit!12373 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259388 () Bool)

(declare-fun e!179983 () Bool)

(assert (=> b!259388 (= e!179982 e!179983)))

(declare-fun res!217286 () Bool)

(assert (=> b!259388 (=> (not res!217286) (not e!179983))))

(declare-datatypes ((tuple2!22228 0))(
  ( (tuple2!22229 (_1!12050 Bool) (_2!12050 BitStream!11346)) )
))
(declare-fun lt!401225 () tuple2!22228)

(declare-fun expected!109 () Bool)

(assert (=> b!259388 (= res!217286 (= (_1!12050 lt!401225) expected!109))))

(declare-fun readBit!0 (BitStream!11346) tuple2!22228)

(assert (=> b!259388 (= lt!401225 (readBit!0 thiss!1754))))

(declare-fun b!259389 () Bool)

(assert (=> b!259389 (= e!179983 (not (or (not (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259389 (validate_offset_bits!1 ((_ sign_extend 32) (size!6212 (buf!6734 (_2!12050 lt!401225)))) ((_ sign_extend 32) (currentByte!12378 (_2!12050 lt!401225))) ((_ sign_extend 32) (currentBit!12373 (_2!12050 lt!401225))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18467 0))(
  ( (Unit!18468) )
))
(declare-fun lt!401224 () Unit!18467)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11346 BitStream!11346 (_ BitVec 64) (_ BitVec 64)) Unit!18467)

(assert (=> b!259389 (= lt!401224 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12050 lt!401225) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!217288 () Bool)

(assert (=> start!55818 (=> (not res!217288) (not e!179982))))

(assert (=> start!55818 (= res!217288 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55818 e!179982))

(assert (=> start!55818 true))

(declare-fun e!179981 () Bool)

(declare-fun inv!12 (BitStream!11346) Bool)

(assert (=> start!55818 (and (inv!12 thiss!1754) e!179981)))

(declare-fun b!259390 () Bool)

(declare-fun array_inv!5953 (array!14186) Bool)

(assert (=> b!259390 (= e!179981 (array_inv!5953 (buf!6734 thiss!1754)))))

(assert (= (and start!55818 res!217288) b!259387))

(assert (= (and b!259387 res!217285) b!259386))

(assert (= (and b!259386 res!217287) b!259388))

(assert (= (and b!259388 res!217286) b!259389))

(assert (= start!55818 b!259390))

(declare-fun m!388715 () Bool)

(assert (=> b!259387 m!388715))

(declare-fun m!388717 () Bool)

(assert (=> b!259390 m!388717))

(declare-fun m!388719 () Bool)

(assert (=> start!55818 m!388719))

(declare-fun m!388721 () Bool)

(assert (=> b!259388 m!388721))

(declare-fun m!388723 () Bool)

(assert (=> b!259389 m!388723))

(declare-fun m!388725 () Bool)

(assert (=> b!259389 m!388725))

(check-sat (not start!55818) (not b!259389) (not b!259390) (not b!259387) (not b!259388))
(check-sat)
