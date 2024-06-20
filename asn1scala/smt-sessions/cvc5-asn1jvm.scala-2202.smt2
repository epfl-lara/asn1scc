; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55816 () Bool)

(assert start!55816)

(declare-fun b!259371 () Bool)

(declare-fun res!217274 () Bool)

(declare-fun e!179969 () Bool)

(assert (=> b!259371 (=> (not res!217274) (not e!179969))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!259371 (= res!217274 (not (= from!526 nBits!535)))))

(declare-fun b!259372 () Bool)

(declare-fun e!179968 () Bool)

(assert (=> b!259372 (= e!179968 (not (or (not (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!14184 0))(
  ( (array!14185 (arr!7198 (Array (_ BitVec 32) (_ BitVec 8))) (size!6211 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11344 0))(
  ( (BitStream!11345 (buf!6733 array!14184) (currentByte!12377 (_ BitVec 32)) (currentBit!12372 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22226 0))(
  ( (tuple2!22227 (_1!12049 Bool) (_2!12049 BitStream!11344)) )
))
(declare-fun lt!401219 () tuple2!22226)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259372 (validate_offset_bits!1 ((_ sign_extend 32) (size!6211 (buf!6733 (_2!12049 lt!401219)))) ((_ sign_extend 32) (currentByte!12377 (_2!12049 lt!401219))) ((_ sign_extend 32) (currentBit!12372 (_2!12049 lt!401219))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18465 0))(
  ( (Unit!18466) )
))
(declare-fun lt!401218 () Unit!18465)

(declare-fun thiss!1754 () BitStream!11344)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11344 BitStream!11344 (_ BitVec 64) (_ BitVec 64)) Unit!18465)

(assert (=> b!259372 (= lt!401218 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12049 lt!401219) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259373 () Bool)

(declare-fun res!217276 () Bool)

(assert (=> b!259373 (=> (not res!217276) (not e!179969))))

(assert (=> b!259373 (= res!217276 (validate_offset_bits!1 ((_ sign_extend 32) (size!6211 (buf!6733 thiss!1754))) ((_ sign_extend 32) (currentByte!12377 thiss!1754)) ((_ sign_extend 32) (currentBit!12372 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217275 () Bool)

(assert (=> start!55816 (=> (not res!217275) (not e!179969))))

(assert (=> start!55816 (= res!217275 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55816 e!179969))

(assert (=> start!55816 true))

(declare-fun e!179971 () Bool)

(declare-fun inv!12 (BitStream!11344) Bool)

(assert (=> start!55816 (and (inv!12 thiss!1754) e!179971)))

(declare-fun b!259374 () Bool)

(assert (=> b!259374 (= e!179969 e!179968)))

(declare-fun res!217273 () Bool)

(assert (=> b!259374 (=> (not res!217273) (not e!179968))))

(declare-fun expected!109 () Bool)

(assert (=> b!259374 (= res!217273 (= (_1!12049 lt!401219) expected!109))))

(declare-fun readBit!0 (BitStream!11344) tuple2!22226)

(assert (=> b!259374 (= lt!401219 (readBit!0 thiss!1754))))

(declare-fun b!259375 () Bool)

(declare-fun array_inv!5952 (array!14184) Bool)

(assert (=> b!259375 (= e!179971 (array_inv!5952 (buf!6733 thiss!1754)))))

(assert (= (and start!55816 res!217275) b!259373))

(assert (= (and b!259373 res!217276) b!259371))

(assert (= (and b!259371 res!217274) b!259374))

(assert (= (and b!259374 res!217273) b!259372))

(assert (= start!55816 b!259375))

(declare-fun m!388703 () Bool)

(assert (=> start!55816 m!388703))

(declare-fun m!388705 () Bool)

(assert (=> b!259372 m!388705))

(declare-fun m!388707 () Bool)

(assert (=> b!259372 m!388707))

(declare-fun m!388709 () Bool)

(assert (=> b!259373 m!388709))

(declare-fun m!388711 () Bool)

(assert (=> b!259374 m!388711))

(declare-fun m!388713 () Bool)

(assert (=> b!259375 m!388713))

(push 1)

(assert (not b!259375))

(assert (not b!259374))

(assert (not b!259372))

(assert (not b!259373))

(assert (not start!55816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

