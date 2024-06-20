; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55692 () Bool)

(assert start!55692)

(declare-fun b!259005 () Bool)

(declare-fun e!179669 () Bool)

(declare-fun e!179668 () Bool)

(assert (=> b!259005 (= e!179669 e!179668)))

(declare-fun res!216968 () Bool)

(assert (=> b!259005 (=> (not res!216968) (not e!179668))))

(declare-datatypes ((array!14135 0))(
  ( (array!14136 (arr!7178 (Array (_ BitVec 32) (_ BitVec 8))) (size!6191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11304 0))(
  ( (BitStream!11305 (buf!6713 array!14135) (currentByte!12342 (_ BitVec 32)) (currentBit!12337 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22168 0))(
  ( (tuple2!22169 (_1!12020 Bool) (_2!12020 BitStream!11304)) )
))
(declare-fun lt!400834 () tuple2!22168)

(declare-fun expected!109 () Bool)

(assert (=> b!259005 (= res!216968 (not (= (_1!12020 lt!400834) expected!109)))))

(declare-fun thiss!1754 () BitStream!11304)

(declare-fun readBit!0 (BitStream!11304) tuple2!22168)

(assert (=> b!259005 (= lt!400834 (readBit!0 thiss!1754))))

(declare-fun b!259006 () Bool)

(declare-fun e!179670 () Bool)

(declare-fun array_inv!5932 (array!14135) Bool)

(assert (=> b!259006 (= e!179670 (array_inv!5932 (buf!6713 thiss!1754)))))

(declare-fun b!259008 () Bool)

(declare-fun res!216970 () Bool)

(assert (=> b!259008 (=> (not res!216970) (not e!179669))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259008 (= res!216970 (validate_offset_bits!1 ((_ sign_extend 32) (size!6191 (buf!6713 thiss!1754))) ((_ sign_extend 32) (currentByte!12342 thiss!1754)) ((_ sign_extend 32) (currentBit!12337 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259009 () Bool)

(declare-fun res!216967 () Bool)

(assert (=> b!259009 (=> (not res!216967) (not e!179669))))

(assert (=> b!259009 (= res!216967 (not (= from!526 nBits!535)))))

(declare-fun res!216969 () Bool)

(assert (=> start!55692 (=> (not res!216969) (not e!179669))))

(assert (=> start!55692 (= res!216969 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55692 e!179669))

(assert (=> start!55692 true))

(declare-fun inv!12 (BitStream!11304) Bool)

(assert (=> start!55692 (and (inv!12 thiss!1754) e!179670)))

(declare-fun b!259007 () Bool)

(assert (=> b!259007 (= e!179668 false)))

(declare-fun lt!400835 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259007 (= lt!400835 (bitIndex!0 (size!6191 (buf!6713 (_2!12020 lt!400834))) (currentByte!12342 (_2!12020 lt!400834)) (currentBit!12337 (_2!12020 lt!400834))))))

(declare-fun lt!400833 () (_ BitVec 64))

(assert (=> b!259007 (= lt!400833 (bitIndex!0 (size!6191 (buf!6713 thiss!1754)) (currentByte!12342 thiss!1754) (currentBit!12337 thiss!1754)))))

(assert (= (and start!55692 res!216969) b!259008))

(assert (= (and b!259008 res!216970) b!259009))

(assert (= (and b!259009 res!216967) b!259005))

(assert (= (and b!259005 res!216968) b!259007))

(assert (= start!55692 b!259006))

(declare-fun m!388355 () Bool)

(assert (=> b!259007 m!388355))

(declare-fun m!388357 () Bool)

(assert (=> b!259007 m!388357))

(declare-fun m!388359 () Bool)

(assert (=> b!259008 m!388359))

(declare-fun m!388361 () Bool)

(assert (=> b!259006 m!388361))

(declare-fun m!388363 () Bool)

(assert (=> b!259005 m!388363))

(declare-fun m!388365 () Bool)

(assert (=> start!55692 m!388365))

(check-sat (not start!55692) (not b!259008) (not b!259005) (not b!259007) (not b!259006))
