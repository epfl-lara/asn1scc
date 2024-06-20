; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55164 () Bool)

(assert start!55164)

(declare-fun b!257469 () Bool)

(declare-fun res!215776 () Bool)

(declare-fun e!178539 () Bool)

(assert (=> b!257469 (=> (not res!215776) (not e!178539))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257469 (= res!215776 (not (= from!526 nBits!535)))))

(declare-fun res!215779 () Bool)

(assert (=> start!55164 (=> (not res!215779) (not e!178539))))

(assert (=> start!55164 (= res!215779 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55164 e!178539))

(assert (=> start!55164 true))

(declare-datatypes ((array!14000 0))(
  ( (array!14001 (arr!7127 (Array (_ BitVec 32) (_ BitVec 8))) (size!6140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11202 0))(
  ( (BitStream!11203 (buf!6662 array!14000) (currentByte!12207 (_ BitVec 32)) (currentBit!12202 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11202)

(declare-fun e!178540 () Bool)

(declare-fun inv!12 (BitStream!11202) Bool)

(assert (=> start!55164 (and (inv!12 thiss!1754) e!178540)))

(declare-fun b!257470 () Bool)

(declare-fun res!215778 () Bool)

(assert (=> b!257470 (=> (not res!215778) (not e!178539))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257470 (= res!215778 (validate_offset_bits!1 ((_ sign_extend 32) (size!6140 (buf!6662 thiss!1754))) ((_ sign_extend 32) (currentByte!12207 thiss!1754)) ((_ sign_extend 32) (currentBit!12202 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257471 () Bool)

(declare-fun array_inv!5881 (array!14000) Bool)

(assert (=> b!257471 (= e!178540 (array_inv!5881 (buf!6662 thiss!1754)))))

(declare-fun b!257472 () Bool)

(declare-fun e!178537 () Bool)

(assert (=> b!257472 (= e!178537 (not true))))

(declare-datatypes ((tuple2!22030 0))(
  ( (tuple2!22031 (_1!11951 Bool) (_2!11951 BitStream!11202)) )
))
(declare-fun lt!398737 () tuple2!22030)

(assert (=> b!257472 (validate_offset_bits!1 ((_ sign_extend 32) (size!6140 (buf!6662 (_2!11951 lt!398737)))) ((_ sign_extend 32) (currentByte!12207 (_2!11951 lt!398737))) ((_ sign_extend 32) (currentBit!12202 (_2!11951 lt!398737))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18383 0))(
  ( (Unit!18384) )
))
(declare-fun lt!398738 () Unit!18383)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11202 BitStream!11202 (_ BitVec 64) (_ BitVec 64)) Unit!18383)

(assert (=> b!257472 (= lt!398738 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11951 lt!398737) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257473 () Bool)

(assert (=> b!257473 (= e!178539 e!178537)))

(declare-fun res!215777 () Bool)

(assert (=> b!257473 (=> (not res!215777) (not e!178537))))

(declare-fun expected!109 () Bool)

(assert (=> b!257473 (= res!215777 (= (_1!11951 lt!398737) expected!109))))

(declare-fun readBit!0 (BitStream!11202) tuple2!22030)

(assert (=> b!257473 (= lt!398737 (readBit!0 thiss!1754))))

(assert (= (and start!55164 res!215779) b!257470))

(assert (= (and b!257470 res!215778) b!257469))

(assert (= (and b!257469 res!215776) b!257473))

(assert (= (and b!257473 res!215777) b!257472))

(assert (= start!55164 b!257471))

(declare-fun m!386969 () Bool)

(assert (=> b!257471 m!386969))

(declare-fun m!386971 () Bool)

(assert (=> b!257473 m!386971))

(declare-fun m!386973 () Bool)

(assert (=> b!257470 m!386973))

(declare-fun m!386975 () Bool)

(assert (=> b!257472 m!386975))

(declare-fun m!386977 () Bool)

(assert (=> b!257472 m!386977))

(declare-fun m!386979 () Bool)

(assert (=> start!55164 m!386979))

(check-sat (not start!55164) (not b!257471) (not b!257470) (not b!257473) (not b!257472))
