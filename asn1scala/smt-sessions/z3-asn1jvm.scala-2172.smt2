; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55134 () Bool)

(assert start!55134)

(declare-fun b!257244 () Bool)

(declare-fun e!178357 () Bool)

(assert (=> b!257244 (= e!178357 false)))

(declare-fun lt!398607 () (_ BitVec 64))

(declare-datatypes ((array!13970 0))(
  ( (array!13971 (arr!7112 (Array (_ BitVec 32) (_ BitVec 8))) (size!6125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11172 0))(
  ( (BitStream!11173 (buf!6647 array!13970) (currentByte!12192 (_ BitVec 32)) (currentBit!12187 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22000 0))(
  ( (tuple2!22001 (_1!11936 Bool) (_2!11936 BitStream!11172)) )
))
(declare-fun lt!398609 () tuple2!22000)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257244 (= lt!398607 (bitIndex!0 (size!6125 (buf!6647 (_2!11936 lt!398609))) (currentByte!12192 (_2!11936 lt!398609)) (currentBit!12187 (_2!11936 lt!398609))))))

(declare-fun lt!398608 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11172)

(assert (=> b!257244 (= lt!398608 (bitIndex!0 (size!6125 (buf!6647 thiss!1754)) (currentByte!12192 thiss!1754) (currentBit!12187 thiss!1754)))))

(declare-fun res!215596 () Bool)

(declare-fun e!178360 () Bool)

(assert (=> start!55134 (=> (not res!215596) (not e!178360))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55134 (= res!215596 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55134 e!178360))

(assert (=> start!55134 true))

(declare-fun e!178359 () Bool)

(declare-fun inv!12 (BitStream!11172) Bool)

(assert (=> start!55134 (and (inv!12 thiss!1754) e!178359)))

(declare-fun b!257245 () Bool)

(declare-fun res!215597 () Bool)

(assert (=> b!257245 (=> (not res!215597) (not e!178360))))

(assert (=> b!257245 (= res!215597 (not (= from!526 nBits!535)))))

(declare-fun b!257246 () Bool)

(assert (=> b!257246 (= e!178360 e!178357)))

(declare-fun res!215598 () Bool)

(assert (=> b!257246 (=> (not res!215598) (not e!178357))))

(declare-fun expected!109 () Bool)

(assert (=> b!257246 (= res!215598 (not (= (_1!11936 lt!398609) expected!109)))))

(declare-fun readBit!0 (BitStream!11172) tuple2!22000)

(assert (=> b!257246 (= lt!398609 (readBit!0 thiss!1754))))

(declare-fun b!257247 () Bool)

(declare-fun array_inv!5866 (array!13970) Bool)

(assert (=> b!257247 (= e!178359 (array_inv!5866 (buf!6647 thiss!1754)))))

(declare-fun b!257248 () Bool)

(declare-fun res!215599 () Bool)

(assert (=> b!257248 (=> (not res!215599) (not e!178360))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257248 (= res!215599 (validate_offset_bits!1 ((_ sign_extend 32) (size!6125 (buf!6647 thiss!1754))) ((_ sign_extend 32) (currentByte!12192 thiss!1754)) ((_ sign_extend 32) (currentBit!12187 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55134 res!215596) b!257248))

(assert (= (and b!257248 res!215599) b!257245))

(assert (= (and b!257245 res!215597) b!257246))

(assert (= (and b!257246 res!215598) b!257244))

(assert (= start!55134 b!257247))

(declare-fun m!386789 () Bool)

(assert (=> b!257246 m!386789))

(declare-fun m!386791 () Bool)

(assert (=> b!257244 m!386791))

(declare-fun m!386793 () Bool)

(assert (=> b!257244 m!386793))

(declare-fun m!386795 () Bool)

(assert (=> b!257247 m!386795))

(declare-fun m!386797 () Bool)

(assert (=> start!55134 m!386797))

(declare-fun m!386799 () Bool)

(assert (=> b!257248 m!386799))

(check-sat (not b!257244) (not start!55134) (not b!257248) (not b!257247) (not b!257246))
