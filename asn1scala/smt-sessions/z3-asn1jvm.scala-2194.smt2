; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55686 () Bool)

(assert start!55686)

(declare-fun b!258960 () Bool)

(declare-fun e!179632 () Bool)

(assert (=> b!258960 (= e!179632 false)))

(declare-fun lt!400806 () (_ BitVec 64))

(declare-datatypes ((array!14129 0))(
  ( (array!14130 (arr!7175 (Array (_ BitVec 32) (_ BitVec 8))) (size!6188 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11298 0))(
  ( (BitStream!11299 (buf!6710 array!14129) (currentByte!12339 (_ BitVec 32)) (currentBit!12334 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22162 0))(
  ( (tuple2!22163 (_1!12017 Bool) (_2!12017 BitStream!11298)) )
))
(declare-fun lt!400807 () tuple2!22162)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258960 (= lt!400806 (bitIndex!0 (size!6188 (buf!6710 (_2!12017 lt!400807))) (currentByte!12339 (_2!12017 lt!400807)) (currentBit!12334 (_2!12017 lt!400807))))))

(declare-fun lt!400808 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11298)

(assert (=> b!258960 (= lt!400808 (bitIndex!0 (size!6188 (buf!6710 thiss!1754)) (currentByte!12339 thiss!1754) (currentBit!12334 thiss!1754)))))

(declare-fun res!216932 () Bool)

(declare-fun e!179635 () Bool)

(assert (=> start!55686 (=> (not res!216932) (not e!179635))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55686 (= res!216932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55686 e!179635))

(assert (=> start!55686 true))

(declare-fun e!179634 () Bool)

(declare-fun inv!12 (BitStream!11298) Bool)

(assert (=> start!55686 (and (inv!12 thiss!1754) e!179634)))

(declare-fun b!258961 () Bool)

(assert (=> b!258961 (= e!179635 e!179632)))

(declare-fun res!216934 () Bool)

(assert (=> b!258961 (=> (not res!216934) (not e!179632))))

(declare-fun expected!109 () Bool)

(assert (=> b!258961 (= res!216934 (not (= (_1!12017 lt!400807) expected!109)))))

(declare-fun readBit!0 (BitStream!11298) tuple2!22162)

(assert (=> b!258961 (= lt!400807 (readBit!0 thiss!1754))))

(declare-fun b!258962 () Bool)

(declare-fun res!216933 () Bool)

(assert (=> b!258962 (=> (not res!216933) (not e!179635))))

(assert (=> b!258962 (= res!216933 (not (= from!526 nBits!535)))))

(declare-fun b!258963 () Bool)

(declare-fun array_inv!5929 (array!14129) Bool)

(assert (=> b!258963 (= e!179634 (array_inv!5929 (buf!6710 thiss!1754)))))

(declare-fun b!258964 () Bool)

(declare-fun res!216931 () Bool)

(assert (=> b!258964 (=> (not res!216931) (not e!179635))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258964 (= res!216931 (validate_offset_bits!1 ((_ sign_extend 32) (size!6188 (buf!6710 thiss!1754))) ((_ sign_extend 32) (currentByte!12339 thiss!1754)) ((_ sign_extend 32) (currentBit!12334 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55686 res!216932) b!258964))

(assert (= (and b!258964 res!216931) b!258962))

(assert (= (and b!258962 res!216933) b!258961))

(assert (= (and b!258961 res!216934) b!258960))

(assert (= start!55686 b!258963))

(declare-fun m!388319 () Bool)

(assert (=> b!258964 m!388319))

(declare-fun m!388321 () Bool)

(assert (=> b!258960 m!388321))

(declare-fun m!388323 () Bool)

(assert (=> b!258960 m!388323))

(declare-fun m!388325 () Bool)

(assert (=> b!258961 m!388325))

(declare-fun m!388327 () Bool)

(assert (=> b!258963 m!388327))

(declare-fun m!388329 () Bool)

(assert (=> start!55686 m!388329))

(check-sat (not b!258964) (not b!258960) (not b!258961) (not b!258963) (not start!55686))
