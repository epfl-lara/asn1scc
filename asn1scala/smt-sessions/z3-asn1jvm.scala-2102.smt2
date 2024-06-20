; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53336 () Bool)

(assert start!53336)

(declare-fun b!247584 () Bool)

(declare-fun e!171523 () Bool)

(declare-fun e!171524 () Bool)

(assert (=> b!247584 (= e!171523 e!171524)))

(declare-fun res!207196 () Bool)

(assert (=> b!247584 (=> res!207196 e!171524)))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun lt!385923 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247584 (= res!207196 (not (= lt!385923 (bvadd lt!385923 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13506 0))(
  ( (array!13507 (arr!6908 (Array (_ BitVec 32) (_ BitVec 8))) (size!5921 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10764 0))(
  ( (BitStream!10765 (buf!6405 array!13506) (currentByte!11818 (_ BitVec 32)) (currentBit!11813 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10764)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247584 (= lt!385923 (bitIndex!0 (size!5921 (buf!6405 thiss!1005)) (currentByte!11818 thiss!1005) (currentBit!11813 thiss!1005)))))

(declare-fun res!207194 () Bool)

(declare-fun e!171526 () Bool)

(assert (=> start!53336 (=> (not res!207194) (not e!171526))))

(assert (=> start!53336 (= res!207194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53336 e!171526))

(assert (=> start!53336 true))

(declare-fun e!171525 () Bool)

(declare-fun inv!12 (BitStream!10764) Bool)

(assert (=> start!53336 (and (inv!12 thiss!1005) e!171525)))

(declare-fun b!247585 () Bool)

(assert (=> b!247585 (= e!171524 true)))

(declare-datatypes ((tuple2!21230 0))(
  ( (tuple2!21231 (_1!11537 BitStream!10764) (_2!11537 BitStream!10764)) )
))
(declare-fun lt!385921 () tuple2!21230)

(declare-fun reader!0 (BitStream!10764 BitStream!10764) tuple2!21230)

(assert (=> b!247585 (= lt!385921 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247586 () Bool)

(declare-fun res!207195 () Bool)

(assert (=> b!247586 (=> (not res!207195) (not e!171526))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247586 (= res!207195 (validate_offset_bits!1 ((_ sign_extend 32) (size!5921 (buf!6405 thiss!1005))) ((_ sign_extend 32) (currentByte!11818 thiss!1005)) ((_ sign_extend 32) (currentBit!11813 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247587 () Bool)

(declare-fun res!207197 () Bool)

(assert (=> b!247587 (=> (not res!207197) (not e!171526))))

(assert (=> b!247587 (= res!207197 (bvsge from!289 nBits!297))))

(declare-fun b!247588 () Bool)

(assert (=> b!247588 (= e!171526 (not e!171523))))

(declare-fun res!207198 () Bool)

(assert (=> b!247588 (=> res!207198 e!171523)))

(assert (=> b!247588 (= res!207198 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10764 BitStream!10764) Bool)

(assert (=> b!247588 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17960 0))(
  ( (Unit!17961) )
))
(declare-fun lt!385922 () Unit!17960)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10764) Unit!17960)

(assert (=> b!247588 (= lt!385922 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247589 () Bool)

(declare-fun array_inv!5662 (array!13506) Bool)

(assert (=> b!247589 (= e!171525 (array_inv!5662 (buf!6405 thiss!1005)))))

(assert (= (and start!53336 res!207194) b!247586))

(assert (= (and b!247586 res!207195) b!247587))

(assert (= (and b!247587 res!207197) b!247588))

(assert (= (and b!247588 (not res!207198)) b!247584))

(assert (= (and b!247584 (not res!207196)) b!247585))

(assert (= start!53336 b!247589))

(declare-fun m!373265 () Bool)

(assert (=> b!247584 m!373265))

(declare-fun m!373267 () Bool)

(assert (=> b!247589 m!373267))

(declare-fun m!373269 () Bool)

(assert (=> b!247586 m!373269))

(declare-fun m!373271 () Bool)

(assert (=> b!247588 m!373271))

(declare-fun m!373273 () Bool)

(assert (=> b!247588 m!373273))

(declare-fun m!373275 () Bool)

(assert (=> b!247585 m!373275))

(declare-fun m!373277 () Bool)

(assert (=> start!53336 m!373277))

(check-sat (not b!247586) (not b!247589) (not start!53336) (not b!247584) (not b!247585) (not b!247588))
