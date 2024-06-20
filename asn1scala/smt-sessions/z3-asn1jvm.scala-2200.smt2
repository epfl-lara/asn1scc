; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55776 () Bool)

(assert start!55776)

(declare-fun b!259270 () Bool)

(declare-fun e!179880 () Bool)

(declare-datatypes ((array!14171 0))(
  ( (array!14172 (arr!7193 (Array (_ BitVec 32) (_ BitVec 8))) (size!6206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11334 0))(
  ( (BitStream!11335 (buf!6728 array!14171) (currentByte!12366 (_ BitVec 32)) (currentBit!12361 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11334)

(declare-fun array_inv!5947 (array!14171) Bool)

(assert (=> b!259270 (= e!179880 (array_inv!5947 (buf!6728 thiss!1754)))))

(declare-fun res!217184 () Bool)

(declare-fun e!179881 () Bool)

(assert (=> start!55776 (=> (not res!217184) (not e!179881))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55776 (= res!217184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55776 e!179881))

(assert (=> start!55776 true))

(declare-fun inv!12 (BitStream!11334) Bool)

(assert (=> start!55776 (and (inv!12 thiss!1754) e!179880)))

(declare-fun b!259268 () Bool)

(declare-fun res!217186 () Bool)

(assert (=> b!259268 (=> (not res!217186) (not e!179881))))

(assert (=> b!259268 (= res!217186 (not (= from!526 nBits!535)))))

(declare-fun b!259267 () Bool)

(declare-fun res!217185 () Bool)

(assert (=> b!259267 (=> (not res!217185) (not e!179881))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259267 (= res!217185 (validate_offset_bits!1 ((_ sign_extend 32) (size!6206 (buf!6728 thiss!1754))) ((_ sign_extend 32) (currentByte!12366 thiss!1754)) ((_ sign_extend 32) (currentBit!12361 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259269 () Bool)

(assert (=> b!259269 (= e!179881 false)))

(declare-datatypes ((tuple2!22210 0))(
  ( (tuple2!22211 (_1!12041 Bool) (_2!12041 BitStream!11334)) )
))
(declare-fun lt!401066 () tuple2!22210)

(declare-fun readBit!0 (BitStream!11334) tuple2!22210)

(assert (=> b!259269 (= lt!401066 (readBit!0 thiss!1754))))

(assert (= (and start!55776 res!217184) b!259267))

(assert (= (and b!259267 res!217185) b!259268))

(assert (= (and b!259268 res!217186) b!259269))

(assert (= start!55776 b!259270))

(declare-fun m!388597 () Bool)

(assert (=> b!259270 m!388597))

(declare-fun m!388599 () Bool)

(assert (=> start!55776 m!388599))

(declare-fun m!388601 () Bool)

(assert (=> b!259267 m!388601))

(declare-fun m!388603 () Bool)

(assert (=> b!259269 m!388603))

(check-sat (not b!259267) (not b!259269) (not start!55776) (not b!259270))
