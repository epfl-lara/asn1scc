; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27118 () Bool)

(assert start!27118)

(declare-fun b!139439 () Bool)

(declare-fun res!116235 () Bool)

(declare-fun e!92894 () Bool)

(assert (=> b!139439 (=> (not res!116235) (not e!92894))))

(declare-datatypes ((array!6362 0))(
  ( (array!6363 (arr!3574 (Array (_ BitVec 32) (_ BitVec 8))) (size!2879 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5022 0))(
  ( (BitStream!5023 (buf!3295 array!6362) (currentByte!6131 (_ BitVec 32)) (currentBit!6126 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8711 0))(
  ( (Unit!8712) )
))
(declare-datatypes ((tuple2!12224 0))(
  ( (tuple2!12225 (_1!6438 Unit!8711) (_2!6438 BitStream!5022)) )
))
(declare-fun lt!217304 () tuple2!12224)

(declare-fun thiss!1634 () BitStream!5022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139439 (= res!116235 (= (bitIndex!0 (size!2879 (buf!3295 (_2!6438 lt!217304))) (currentByte!6131 (_2!6438 lt!217304)) (currentBit!6126 (_2!6438 lt!217304))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2879 (buf!3295 thiss!1634)) (currentByte!6131 thiss!1634) (currentBit!6126 thiss!1634)))))))

(declare-fun res!116233 () Bool)

(declare-fun e!92896 () Bool)

(assert (=> start!27118 (=> (not res!116233) (not e!92896))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6362)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27118 (= res!116233 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2879 arr!237))))))

(assert (=> start!27118 e!92896))

(assert (=> start!27118 true))

(declare-fun array_inv!2668 (array!6362) Bool)

(assert (=> start!27118 (array_inv!2668 arr!237)))

(declare-fun e!92897 () Bool)

(declare-fun inv!12 (BitStream!5022) Bool)

(assert (=> start!27118 (and (inv!12 thiss!1634) e!92897)))

(declare-fun b!139440 () Bool)

(declare-fun res!116232 () Bool)

(assert (=> b!139440 (=> (not res!116232) (not e!92894))))

(declare-fun isPrefixOf!0 (BitStream!5022 BitStream!5022) Bool)

(assert (=> b!139440 (= res!116232 (isPrefixOf!0 thiss!1634 (_2!6438 lt!217304)))))

(declare-fun b!139441 () Bool)

(declare-datatypes ((tuple2!12226 0))(
  ( (tuple2!12227 (_1!6439 BitStream!5022) (_2!6439 BitStream!5022)) )
))
(declare-fun lt!217303 () tuple2!12226)

(declare-datatypes ((tuple2!12228 0))(
  ( (tuple2!12229 (_1!6440 BitStream!5022) (_2!6440 (_ BitVec 8))) )
))
(declare-fun lt!217305 () tuple2!12228)

(assert (=> b!139441 (= e!92894 (and (= (_2!6440 lt!217305) (select (arr!3574 arr!237) from!447)) (= (_1!6440 lt!217305) (_2!6439 lt!217303))))))

(declare-fun readBytePure!0 (BitStream!5022) tuple2!12228)

(assert (=> b!139441 (= lt!217305 (readBytePure!0 (_1!6439 lt!217303)))))

(declare-fun reader!0 (BitStream!5022 BitStream!5022) tuple2!12226)

(assert (=> b!139441 (= lt!217303 (reader!0 thiss!1634 (_2!6438 lt!217304)))))

(declare-fun b!139442 () Bool)

(declare-fun res!116234 () Bool)

(assert (=> b!139442 (=> (not res!116234) (not e!92896))))

(assert (=> b!139442 (= res!116234 (bvslt from!447 to!404))))

(declare-fun b!139443 () Bool)

(declare-fun res!116230 () Bool)

(assert (=> b!139443 (=> (not res!116230) (not e!92896))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139443 (= res!116230 (invariant!0 (currentBit!6126 thiss!1634) (currentByte!6131 thiss!1634) (size!2879 (buf!3295 thiss!1634))))))

(declare-fun b!139444 () Bool)

(assert (=> b!139444 (= e!92897 (array_inv!2668 (buf!3295 thiss!1634)))))

(declare-fun b!139445 () Bool)

(assert (=> b!139445 (= e!92896 (not true))))

(assert (=> b!139445 e!92894))

(declare-fun res!116231 () Bool)

(assert (=> b!139445 (=> (not res!116231) (not e!92894))))

(assert (=> b!139445 (= res!116231 (= (size!2879 (buf!3295 thiss!1634)) (size!2879 (buf!3295 (_2!6438 lt!217304)))))))

(declare-fun appendByte!0 (BitStream!5022 (_ BitVec 8)) tuple2!12224)

(assert (=> b!139445 (= lt!217304 (appendByte!0 thiss!1634 (select (arr!3574 arr!237) from!447)))))

(declare-fun b!139446 () Bool)

(declare-fun res!116229 () Bool)

(assert (=> b!139446 (=> (not res!116229) (not e!92896))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139446 (= res!116229 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2879 (buf!3295 thiss!1634))) ((_ sign_extend 32) (currentByte!6131 thiss!1634)) ((_ sign_extend 32) (currentBit!6126 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27118 res!116233) b!139446))

(assert (= (and b!139446 res!116229) b!139442))

(assert (= (and b!139442 res!116234) b!139443))

(assert (= (and b!139443 res!116230) b!139445))

(assert (= (and b!139445 res!116231) b!139439))

(assert (= (and b!139439 res!116235) b!139440))

(assert (= (and b!139440 res!116232) b!139441))

(assert (= start!27118 b!139444))

(declare-fun m!214465 () Bool)

(assert (=> start!27118 m!214465))

(declare-fun m!214467 () Bool)

(assert (=> start!27118 m!214467))

(declare-fun m!214469 () Bool)

(assert (=> b!139445 m!214469))

(assert (=> b!139445 m!214469))

(declare-fun m!214471 () Bool)

(assert (=> b!139445 m!214471))

(declare-fun m!214473 () Bool)

(assert (=> b!139439 m!214473))

(declare-fun m!214475 () Bool)

(assert (=> b!139439 m!214475))

(declare-fun m!214477 () Bool)

(assert (=> b!139443 m!214477))

(declare-fun m!214479 () Bool)

(assert (=> b!139446 m!214479))

(assert (=> b!139441 m!214469))

(declare-fun m!214481 () Bool)

(assert (=> b!139441 m!214481))

(declare-fun m!214483 () Bool)

(assert (=> b!139441 m!214483))

(declare-fun m!214485 () Bool)

(assert (=> b!139444 m!214485))

(declare-fun m!214487 () Bool)

(assert (=> b!139440 m!214487))

(check-sat (not b!139444) (not b!139439) (not b!139440) (not start!27118) (not b!139441) (not b!139446) (not b!139445) (not b!139443))
