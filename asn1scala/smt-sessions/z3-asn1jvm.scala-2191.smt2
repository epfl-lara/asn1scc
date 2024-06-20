; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55608 () Bool)

(assert start!55608)

(declare-fun b!258776 () Bool)

(declare-fun res!216773 () Bool)

(declare-fun e!179488 () Bool)

(assert (=> b!258776 (=> (not res!216773) (not e!179488))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258776 (= res!216773 (= from!526 nBits!535))))

(declare-fun b!258778 () Bool)

(declare-fun e!179486 () Bool)

(declare-datatypes ((array!14105 0))(
  ( (array!14106 (arr!7166 (Array (_ BitVec 32) (_ BitVec 8))) (size!6179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11280 0))(
  ( (BitStream!11281 (buf!6701 array!14105) (currentByte!12318 (_ BitVec 32)) (currentBit!12313 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11280)

(declare-fun array_inv!5920 (array!14105) Bool)

(assert (=> b!258778 (= e!179486 (array_inv!5920 (buf!6701 thiss!1754)))))

(declare-fun b!258775 () Bool)

(declare-fun res!216774 () Bool)

(assert (=> b!258775 (=> (not res!216774) (not e!179488))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258775 (= res!216774 (validate_offset_bits!1 ((_ sign_extend 32) (size!6179 (buf!6701 thiss!1754))) ((_ sign_extend 32) (currentByte!12318 thiss!1754)) ((_ sign_extend 32) (currentBit!12313 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!216775 () Bool)

(assert (=> start!55608 (=> (not res!216775) (not e!179488))))

(assert (=> start!55608 (= res!216775 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55608 e!179488))

(assert (=> start!55608 true))

(declare-fun inv!12 (BitStream!11280) Bool)

(assert (=> start!55608 (and (inv!12 thiss!1754) e!179486)))

(declare-fun b!258777 () Bool)

(declare-fun lt!400517 () (_ BitVec 64))

(assert (=> b!258777 (= e!179488 (not (= (bvsub (bvadd lt!400517 nBits!535) from!526) lt!400517)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258777 (= lt!400517 (bitIndex!0 (size!6179 (buf!6701 thiss!1754)) (currentByte!12318 thiss!1754) (currentBit!12313 thiss!1754)))))

(assert (= (and start!55608 res!216775) b!258775))

(assert (= (and b!258775 res!216774) b!258776))

(assert (= (and b!258776 res!216773) b!258777))

(assert (= start!55608 b!258778))

(declare-fun m!388147 () Bool)

(assert (=> b!258778 m!388147))

(declare-fun m!388149 () Bool)

(assert (=> b!258775 m!388149))

(declare-fun m!388151 () Bool)

(assert (=> start!55608 m!388151))

(declare-fun m!388153 () Bool)

(assert (=> b!258777 m!388153))

(check-sat (not b!258778) (not b!258775) (not start!55608) (not b!258777))
